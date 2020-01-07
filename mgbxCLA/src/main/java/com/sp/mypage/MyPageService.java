package com.sp.mypage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	public List<MyPage> listReservation(Map<String, Object> map);
	public List<MyPage> listStore(Map<String, Object> map);
	public List<MyPage> listMyMovieStory(Map<String, Object> map);
	public MyPage listPoint(String userId) throws Exception;
	public MyPage listMembership(String userId) throws Exception;
}
