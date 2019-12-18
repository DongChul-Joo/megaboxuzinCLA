package com.sp.customer.question;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

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
	
	@RequestMapping(value="/customer/question/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		
		model.addAttribute("mode", "created");
		return "customer/question/created";
	}
	
	@RequestMapping(value="/customer/question/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Question dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String qisanswer="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertQuestion(dto, "created");
		} catch (Exception e) {		
			qisanswer = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("qisanswer", qisanswer);
		
		
		
		return model;
	}
	



}
