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

	@Override
	public List<MyPage> listPoint2(Map<String, Object> map) {
		List<MyPage> list = null;
				try {
					list = dao.selectList("mypage.listPoint2" , map);
				} catch (Exception e) {
					e.printStackTrace();
				}
		return list;
	}

	@Override
	public void insertMyPage(MyPage dto, String pathname) throws Exception {
		
		try {
			
			dao.insertData("mypage.insertMyPage", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
			int result=0;
			
			try {
				result = dao.selectOne("mypage.dataCount", map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		return result;
	}

	@Override
	public int dataCountMovie(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("mypage.dataCountMovie", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int dataCountStore(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("mypage.dataCountStore", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
