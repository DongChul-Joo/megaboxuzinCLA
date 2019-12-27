package com.sp.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(".movieController.movieController")
public class MovieController {
	@Autowired
	private MovieService service;
	
	@RequestMapping(value="/movie/newmovie", method=RequestMethod.GET)
	public String showingList(
			Model model
			) { 
		Movie dto = new Movie();
		
		try {
			dto.setAudits(dto.getAudits().substring(0,1));
			dto = service.readMovie();
			
			model.addAttribute("listMovie", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".movie.newmovie";
	}
	
}
