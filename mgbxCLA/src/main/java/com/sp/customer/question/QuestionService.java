package com.sp.customer.question;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	
	public void insertQuestion(Question dto, String mode) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Question> listQuestion(Map<String, Object> map);
	
	public List<Question> relationQuestion(int num);
	public Question readQuestion(int num);
	
	public void updateQuestionQisanswer(Map<String, Object> map) throws Exception;
	public void updateQuestion(Question dto) throws Exception;
	public void deleteQuestion(int num) throws Exception;
	public List<Question> listCategory(Map<String, Object> map);
	

}
