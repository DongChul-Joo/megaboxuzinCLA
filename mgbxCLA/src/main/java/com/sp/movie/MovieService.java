package com.sp.movie;

import java.util.List;
import java.util.Map;

public interface MovieService {
	public List<Movie> readMovie(Map<String, Object> map); 
	
	public int dataCount(Map<String, Object> map);
}
 