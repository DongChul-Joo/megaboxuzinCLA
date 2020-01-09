package com.sp.movie;

import java.util.List;
import java.util.Map;

public interface MovieService {
	public List<Movie> readMovie(Map<String, Object> map); 
	
	public int dataCount(Map<String, Object> map);
	
	public Movie readDetail(int movieCode);
	
	public List<Movie> readMovieReply(Map<String, Object> map);
	
	public int replyCount(Map<String, Object> map);
	
	public void insertReply(Movie dto) throws Exception;
	
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public void updateReply(Map<String, Object> map) throws Exception;
}
 