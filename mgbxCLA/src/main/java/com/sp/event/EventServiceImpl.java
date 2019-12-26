package com.sp.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("event.eventService")
public class EventServiceImpl implements EventService{
	@Autowired
	private CommonDAO dao;
	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list=null;
		
		try {
			list=dao.selectList("event.listEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("event.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	@Override
	public Event readEvent(int num) {
		Event dto=null;
		
		try {
			dto=dao.selectOne("event.readEvent", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public List<Event> listCategory() {
		List<Event> list=null;
		try {
			list=dao.selectList("event.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("event.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("event.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public int replyAnswerCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("event.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("event.insertReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap=null;
		try {
			countMap=dao.selectOne("event.replyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}
	@Override
	public void insertReplyReport(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("event.insertReplyReport", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
}
