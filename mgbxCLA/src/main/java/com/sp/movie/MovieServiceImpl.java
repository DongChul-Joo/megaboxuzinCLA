package com.sp.movie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("movie.movieService")
public class MovieServiceImpl implements MovieService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Movie readMovie() {
		Movie dto =null;
		try {
			dao.selectList("movie.listShowingMovie", dto);
		} catch (Exception e) {
			
		}
		
		return dto;
	}

}
