package com.sp.customer.question;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("customer.questionService")
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertQuestion(Question dto, String mode) throws Exception {
			try {
				
				dao.insertData("question.insertQuestion1", dto);				
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("question.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Question> listQuestion(Map<String, Object> map) {
		List<Question> list  = null;
		try {
			list = dao.selectList("question.listQuestion", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Question> relationQuestion(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Question readQuestion1(int code) {
		Question dto = null;
		
		try {
			dto=dao.selectOne("question.readQuestion1", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Question readQuestion2(int code) {
		Question dto = null;
		try {
			dto=dao.selectOne("question.readQuestion2", code);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public void updateQuestionQisanswer(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("question.updateQuestionQisanswer", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateQuestion(Question dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuestion(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Question> listCategory(Map<String, Object> map) {
		List<Question> list = null;
		
			try {
				list = dao.selectList("question.listCategory" , map);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		return list;
	}

	@Override
	public void insertQuestionAnswer(Question dto, String mode) throws Exception {
		try {

			if(mode.equals("reply")) {
				dto.setType(1);
				dto.setIsAnswer(1);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("code", dto.getParent());
				map.put("isAnswer", "1");
				map.put("type", "1");
				updateQuestionQisanswer(map);					
			} else {
				dto.setType(0);
			}
			
			dao.insertData("question.insertQuestion2", dto);				
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
		
	}
	
}
