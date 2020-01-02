package com.sp.movie;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;

@Controller(".movieController.movieController")
public class MovieController {
	@Autowired
	private MovieService service;
	
	@Autowired
	private MyUtil myUtil;
	
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
	
	@RequestMapping(value="/movie/movieDetail")
	public String movieDetail() {
		
		return "movie/movieDetail";
	}
}
