package com.sp.movie;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("movie.movieService")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Movie> readMovie(Map<String, Object> map) {
		List<Movie> list = new ArrayList<>();
		
		try {
			
			list = dao.selectList("movie.listShowingMovie", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("movie.dataCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Movie readDetail(int movieCode) {
		Movie dto = null;
		
		try {
			dto=dao.selectOne("movie.movieDetail", movieCode);
			dao.selectOne("movie.idCount", movieCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int idCount(int movieCode) {
		int result = 0;
		try {
			result =dao.selectOne("movie.idCount", movieCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Movie> readMovieReply(Map<String, Object> map) {
		List<Movie> list = null;
		
		try {
			list = dao.selectList("movie.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("movie.replyCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Movie dto) throws Exception {
		try {
			dao.insertData("movie.insertReply", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("movie.deleteMovieReply", map);
			dao.deleteData("movie.deleteMovieScore", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	
	}

	@Override
	public void updateReply(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("movie.updateReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw(e);
		}
	
	}

	@Override
	public void replyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("movie.ReplyLike", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int replyLikeCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result=dao.selectOne("movie.replyLikeCount", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public void deleteReplyCount(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("movie.deleteLikeCount", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int checkData(Map<String, Object> map) throws Exception {
		int result= 0;
		try {
			result = dao.selectOne("movie.checkData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	

}
