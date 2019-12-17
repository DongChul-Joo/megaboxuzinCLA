package com.sp.customer.question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.common.MyUtil;

@Controller("customer.questionController")
public class QuestionController {
	
	@Autowired
	private QuestionService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customer/question/list")
	public String list() {
			
		return "customer/question/list";
	}
	



}
