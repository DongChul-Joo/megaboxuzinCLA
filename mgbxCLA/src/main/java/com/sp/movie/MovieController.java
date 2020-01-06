package com.sp.movie;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;

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
			Model model
			) {
		
		Movie dto = null;
		try {
			dto=service.readDetail(movieCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("movie", dto);
		
		return "/movie/detailMovie";
	}
	
	
}
