package com.sp.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Event readEvent(int num);
	public List<Event> listCategory();

	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	public void insertReplyReport(Map<String, Object> map) throws Exception;
}
