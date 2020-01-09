package com.sp.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("mypage.mypageService")
public class MyPageServiceImpl implements MyPageService {
	@Autowired 
	private CommonDAO dao;

	@Override
	public List<MyPage> listReservation(Map<String, Object> map) {
		List<MyPage> list = null;
		
		try {
			list = dao.selectList("mypage.listReservation", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public List<MyPage> listStore(Map<String, Object> map) {
		List<MyPage> list = null;
		
		try {
			list =dao.selectList("mypage.listStore", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MyPage> listMyMovieStory(Map<String, Object> map) {
		List<MyPage> list = null;
		
		try {
			list =dao.selectList("mypage.listMyMovieStory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MyPage listPoint(String userId) throws Exception {
		MyPage dto=null;
		try {
			dto=dao.selectOne("mypage.listPoint", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public MyPage listMembership(String userId) throws Exception {
		MyPage dto = null;
		try {
			dto = dao.selectOne("mypage.listMembership", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}