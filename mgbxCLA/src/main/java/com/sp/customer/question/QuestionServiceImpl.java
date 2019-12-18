package com.sp.customer.question;

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
				dao.insertData("question.insertQuestion3", dto);
				
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Question> listQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Question> relationQuestion(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Question readQuestion(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateQuestionQisanswer(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateQuestion(Question dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuestion(int num) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
