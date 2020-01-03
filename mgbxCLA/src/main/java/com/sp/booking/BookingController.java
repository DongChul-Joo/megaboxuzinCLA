package com.sp.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.common.MyUtil;
import com.sp.movie.Movie;
import com.sp.movie.MovieService;

@Controller("booking.bokingController")
public class BookingController {
	@Autowired private MovieService service;
	@Autowired private MyUtil myUtil;

	@RequestMapping(value="/booking/booking",method=RequestMethod.GET)
	public String bookingForm(
			Model model
			) {
		
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount= service.dataCount(map);

		int offset = 0;
        map.put("offset", offset);
        map.put("rows", dataCount);
		
       
        List<Movie> list = service.readMovie(map);
      
        model.addAttribute("list", list);
	
		return ".booking.booking";
	}
}
