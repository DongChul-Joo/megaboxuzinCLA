package com.sp.movie.comingsoon;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("movie.comingsoon.movieService")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Movie> readMovie(Map<String, Object> map) {
		List<Movie> list = new ArrayList<>();
		
		try {
			
			list = dao.selectList("soonmovie.listShowingMovie", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("soonmovie.dataCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Movie readDetail(int movieCode) {
		Movie dto = null;
		
		try {
			dto=dao.selectOne("soonmovie.movieDetail", movieCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Movie> readMovieReply(Map<String, Object> map) {
		List<Movie> list = null;
		
		try {
			list = dao.selectList("soonmovie.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("soonmovie.replyCount", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(Movie dto) throws Exception {
		try {
			dao.insertData("soonmovie.insertReply", dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("soonmovie.deleteReportUserId", map);
			dao.deleteData("soonmovie.deleteLikeCount", map);
			dao.deleteData("soonmovie.deleteMovieScore", map);
			dao.deleteData("soonmovie.deleteMovieReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	
	}

	@Override
	public void updateReply(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("soonmovie.updateReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw(e);
		}
	
	}

	@Override
	public void replyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("soonmovie.ReplyLike", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int replyLikeCount(Map<String, Object> map) throws Exception {
		int result = 0;
		try {
			result=dao.selectOne("soonmovie.replyLikeCount", map);
		} catch (Exception e) {
			throw e;
		}
		
		return result;
	}

	@Override
	public void deleteReplyCount(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("soonmovie.deleteLikeCount", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int checkData(Map<String, Object> map) throws Exception {
		int result= 0;
		try {
			result = dao.selectOne("soonmovie.checkData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReportUserId(Map<String, Object> map) throws Exception {
		
		
		try {
			dao.insertData("soonmovie.insertReport", map);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public int countReportUserId(Map<String, Object> map) throws Exception {
		int result=0;
		
		try {
			result = dao.selectOne("soonmovie.countReportUserId", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	

}
