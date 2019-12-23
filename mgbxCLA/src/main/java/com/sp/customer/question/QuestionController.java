package com.sp.customer.question;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userId", info.getUserId());
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		 int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
		
		List<Question> list = service.listQuestion(map);
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging" , paging);
		
		model.addAttribute("condition" , condition);
		model.addAttribute("keyword", keyword);
			
		return "customer/question/list";
	}
	
	@RequestMapping(value="/customer/question/created", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		
		
		//대분류 
		Map<String, Object> map = new HashMap<>();
		List<Question> list = service.listCategory(map);
		
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", "1");
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
	
	@RequestMapping(value="/customer/question/article")
	public String article(
			@RequestParam int code,
			@RequestParam String pageNo,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Question dto = service.readQuestion1(code);
		Question adto = service.readQuestion2(code);
		
		if(dto==null) {
			return "customer/error";
			
		}
		
		if(! info.getUserId().equals("admin") && ! info.getUserId().equals(dto.getUserId())) {
			return "customer/error";
		}

		model.addAttribute("adto", adto);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
				
		return "customer/question/article";
		
	}



}
