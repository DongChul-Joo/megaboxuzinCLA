package com.sp.movie.comingsoon;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;
import com.sp.movie.APISerializer;

@Controller(".comingsoon.movieController")
public class MovieController {
	@Autowired
	private MovieService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private APISerializer apiSerializer;
	
	
	
	@RequestMapping(value="/movie/comingsoon/newmovie")
	public String showingList(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) { 
		
		
		String cp= req.getContextPath();
		
		int rows = 18; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount= service.dataCount(map);
		if(dataCount!=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page< current_page) {
			current_page = total_page; 
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
       
        List<Movie> list = service.readMovie(map);
		
        
        int listNum, n = 0;
        for(Movie dto2 : list) {
        	listNum = dataCount - (offset + n);
            dto2.setListNum(listNum);
            System.out.println("결과======================================="+dto2.getDday());
            n++;
        }
        String listUrl = cp+"/movie/comingsoon/newmovie";
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".movie.comingsoon.newmovie";
	}
	
	@RequestMapping(value="/movie/comingsoon/showDetail", produces="application/json;charset=utf-8")
	@ResponseBody
	public String showDetail(
			@RequestParam(defaultValue="") String movieCode
			) throws Exception{
		
		
		String result = "";
		
		String url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&movieCd";
		
		if(movieCode != "") {
			url="http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&movieCd="+movieCode;
		}
		
		
		
		result = apiSerializer.jsonToString(url);
		
		
		return result;
	}
	
	
	@RequestMapping(value="/movie/comingsoon/getAudience", produces="application/json;charset=utf-8")
	@ResponseBody
	public String getAudience() throws Exception{
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		cal.add(Calendar.DATE, -1);
		String date = dateFormat.format(cal.getTime());

		String result = "";
		
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&targetDt";
		
		if(date != "") {
			url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&targetDt="+date;
		}
		
		result = apiSerializer.jsonToString(url);
		
		return result;
	}
	
	
	@RequestMapping(value="/movie/comingsoon/movieDetail")
	public String movieDetail(
			@RequestParam(defaultValue="0") int movieCode, 
			Model model,
			HttpSession session
			) throws Exception{
		
		Movie dto = new Movie();
		
		try {
			dto=service.readDetail(movieCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("movie", dto);
		
		return "/movie/comingsoon/movieDetail";
	}
	
	
	@RequestMapping(value="/movie/comingsoon/listReply")
	public String listReply(
			@RequestParam int movieCode, 
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Movie dto,
			Model model
			,HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int rows = 10; 
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("movieCode", movieCode);
		dataCount= service.replyCount(map);
	    
		
		if(dataCount!=0) {
	    		total_page = myUtil.pageCount(rows, dataCount);
	    	}
		
		if(total_page< current_page) {
			current_page = total_page; 
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		
        map.put("offset", offset);
        map.put("rows", rows);
        
       
        List<Movie> list = service.readMovieReply(map);
        
		
       for(Movie dto2 : list) {
    	   dto2.setContent(dto2.getContent().replaceAll("\n", "<br>"));
       }
       	
       	dto.setMovieCode(movieCode);
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
        model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("info", info);
		
		return "movie/comingsoon/listReply";
	}
	
	@RequestMapping(value="movie/comingsoon/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			@RequestParam int movieCode,
			@RequestParam String content,
			Movie dto,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		String hasReply="false";
		
		try {
			dto.setMovieCode(movieCode);
			dto.setContent(content);
			dto.setUserId(info.getUserId());
			
			service.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("dto", dto);
		model.put("hasReply", hasReply);
		
		return model;
	}
	
	@RequestMapping(value="/movie/comingsoon/deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session,
			Movie dto
			){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			paramMap.put("userId", dto.getUserId());
			service.deleteReply(paramMap);
			
		} catch (Exception e) {
			state="false";
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		map.put("info", info);
		return map;
	}
	
	@RequestMapping(value="/movie/comingsoon/updateDone")
	@ResponseBody
	public String updateForm(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session,
			Movie dto
			) {
		
		String result="true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		
		try {
			dto.setUserId(info.getUserId());
			paramMap.put("userId", dto.getUserId());
			service.updateReply(paramMap);
		} catch (Exception e) {
			e.printStackTrace();
			result="false";
		}
		
		return result;
	}
	
	@RequestMapping(value="/movie/comingsoon/replyLike")
	@ResponseBody
	public Map<String, Object> replyLike(
			@RequestParam Map<String, Object> paramMap,
			@RequestParam int movieCode,
			@RequestParam String userId,
			HttpSession session,
			Movie dto
			){
		String state="true";
		String loginState= "";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> model=new HashMap<>();
		
		int count = 0;
		
		try {
			paramMap.put("movieCode", movieCode);
			paramMap.put("userId", userId);
			paramMap.put("likeUserId", info.getUserId());
			
			if(service.checkData(paramMap) >0) {
				state ="false";
				service.deleteReplyCount(paramMap);
			} else {
				service.replyLike(paramMap);
			}
			count = service.replyLikeCount(paramMap);
			
			dto.setLikeCount(count);
		}catch (NullPointerException e1) {
			loginState= "false";
			
		
		} catch (Exception e) {
			e.printStackTrace();
			
		} 
		
		model.put("dto", dto);
		model.put("count", count);
		model.put("state", state);
		model.put("loginState", loginState);
		
		return model;
	}
	
	@RequestMapping(value="/movie/comingsoon/reportUserId")
	@ResponseBody
	public Map<String, Object> insertReportUserId(
			@RequestParam Map<String, Object> paramMap, 
			@RequestParam int movieCode,
			@RequestParam String userId,
			String reportUserId,
			HttpSession session,
			Movie dto
			) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state ="true";
		Map<String, Object> map = new HashMap<>();
		
		try {
			dto.setReportUserId(info.getUserId());
			paramMap.put("reportUserId", dto.getReportUserId());
			paramMap.put("movieCode", movieCode);
			paramMap.put("userId", userId);
			
			service.insertReportUserId(paramMap);
			
			int countUserId = service.countReportUserId(paramMap);
			System.out.println(countUserId+"::::::::::::::::");
			if(countUserId >=3) {
				service.deleteReply(paramMap);
			}
		} catch (Exception e) {
			state = "false";
			e.printStackTrace();
		}
		map.put("state", state);
		
		
		return map;
		
	}
	
}
