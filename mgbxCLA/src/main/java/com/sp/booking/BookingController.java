package com.sp.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.branchCla.BranchCla;
import com.sp.branchCla.BranchClaService;
import com.sp.movie.Movie;
import com.sp.movie.MovieService;

@Controller("booking.bokingController")
public class BookingController {
	@Autowired private MovieService movieService;
	@Autowired private BranchClaService branchService;

	@RequestMapping(value="/booking/booking",method=RequestMethod.GET)
	public String bookingForm(
			Model model
			) {
		
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		
		dataCount= movieService.dataCount(map);

		int offset = 0;
        map.put("offset", offset);
        map.put("rows", dataCount);
		
       
        List<Movie> movieList = null;   
        List<BranchCla> areaList=null;
        List<BranchCla> branchList=null;
        try {
           areaList=branchService.listArea();
     
           movieList =movieService.readMovie(map);
        } catch (Exception e) {
           return "redirect:/error/dataAccessFailure";
        }
        
        model.addAttribute("areaList",areaList);
        model.addAttribute("movieList", movieList);
        
        
        
	
		return ".booking.booking";
	}
}
