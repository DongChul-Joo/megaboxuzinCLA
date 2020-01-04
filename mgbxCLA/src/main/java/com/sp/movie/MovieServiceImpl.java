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
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


}
