package com.sp.movie.comingsoon;

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
	
	public int idCount(int movieCode);
	
	public void replyLike(Map<String, Object> map) throws Exception;
	
	public int replyLikeCount(Map<String, Object> map) throws Exception;
	
	public void deleteReplyCount(Map<String, Object> map) throws Exception;
	
	public int checkData(Map<String, Object> map)throws Exception;
	
	public void insertReportUserId(Map<String, Object> map) throws Exception;
	
	public int countReportUserId(Map<String, Object> map) throws Exception;
}
 