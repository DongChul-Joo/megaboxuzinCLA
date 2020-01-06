package com.sp.main;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.movie.APISerializer;
import com.sp.movie.Movie;
import com.sp.movie.MovieService;

@Controller("mainController")
public class MainController {
	@Autowired
	private MovieService service; 
	
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method(Model model) {
		
		Map<String, Object> map = new HashMap<>();
		int dataCount = service.dataCount(map);
		
		
		List<Movie> list = service.readMovie(map);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		
		return ".mainLayout";
	}
	
	
	@RequestMapping(value="/main/showDetail", produces="application/json;charset=utf-8")
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
	
	
	@RequestMapping(value="/main/getAudience", produces="application/json;charset=utf-8")
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
	
	
	@RequestMapping(value="/main/movieDetail")
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
		
		return "/main/movieDetail";
	}
	
}
