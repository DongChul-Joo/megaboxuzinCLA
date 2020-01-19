package com.sp.mypage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public List<MyPage> listReservation(Map<String, Object> map);
	public List<MyPage> listStore(Map<String, Object> map);
	public List<MyPage> listMyMovieStory(Map<String, Object> map);
	public MyPage listPoint(String userId) throws Exception;
	public MyPage listMembership(String userId) throws Exception;
	public List<MyPage> listPoint2(Map<String, Object> map);
	public void insertMyPage(MyPage dto) throws Exception;
	public int dataCount(Map<String, Object> map);
	public int dataCountMovie(Map<String, Object> map);
	public int dataCountStore(Map<String, Object> map);
	public int dataCountMileage(Map<String, Object> map);
	
	
	
}
