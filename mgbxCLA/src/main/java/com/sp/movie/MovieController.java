package com.sp.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("movieController")
public class MovieController {
	
	@RequestMapping(value="/movie/newmovie", method=RequestMethod.GET)
	public String method() {
		return ".movie.newmovie";
	}
}
