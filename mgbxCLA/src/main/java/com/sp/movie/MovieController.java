package com.sp.movie;

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

@Controller(".movieController.movieController")
public class MovieController {
	@Autowired
	private MovieService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private APISerializer apiSerializer;
	
	
	
	@RequestMapping(value="/movie/newmovie")
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
        for(Movie dto : list) {
        	listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }
       
        String listUrl = cp+"/movie/newmovie";
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".movie.newmovie";
	}
	
	@RequestMapping(value="/movie/showDetail", produces="application/json;charset=utf-8")
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
	
	
	@RequestMapping(value="/movie/getAudience", produces="application/json;charset=utf-8")
	@ResponseBody
	public String getAudience() throws Exception{
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		cal.add(Calendar.DATE, -1);
		String date = dateFormat.format(cal.getTime());
		System.out.println("---------------------------------------------------"+date);

		String result = "";
		
		String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&targetDt";
		
		if(date != "") {
			url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=dcc1f12995a2b19c3bc5f4f8c32ff84c&targetDt="+date;
		}
		
		result = apiSerializer.jsonToString(url);
		
		return result;
	}
	
	
	@RequestMapping(value="/movie/movieDetail")
	public String movieDetail(
			@RequestParam(defaultValue="0") int movieCode, 
			Model model,
			HttpSession session
			) throws Exception{
		
		Movie dto = new Movie();
		
		try {
			dto=service.readDetail(movieCode);
			
		} catch (Exception e) {
		}
		model.addAttribute("movie", dto);
		
		return "/movie/movieDetail";
	}
	
	
	@RequestMapping(value="/movie/listReply")
	public String listReply(
			@RequestParam int movieCode, 
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			,HttpSession session
			) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		int rows = 10; 
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount= service.replyCount(map);
		if(dataCount!=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page< current_page) {
			current_page = total_page; 
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map.put("movieCode", movieCode);
        map.put("offset", offset);
        map.put("rows", rows);
       
        List<Movie> list = service.readMovieReply(map);
        
		
       for(Movie dto : list) {
    	   dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
       }
       
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        model.addAttribute("movie", info);
		
		return "movie/listReply";
	}
	
	@RequestMapping(value="movie/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			@RequestParam int movieScores,
			@RequestParam int movieCode,
			@RequestParam String content,
			Movie dto,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		
		try {
			dto.setMovieCode(movieCode);
			dto.setContent(content);
			dto.setUserId(info.getUserId());
			System.out.println("======================================================================="+info.getUserId());
			dto.setMovieScores(movieScores);
			
			service.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			state="false";
			
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("dto", dto);
		
		return model;
	}
	
	
}
