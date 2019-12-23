package com.sp.event;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

@Controller("event.eventController")
public class EventController {

	@Autowired
	private EventService service;
	@Autowired
	private MyUtil myUtil;
	
	// 리스트 만들기
	@RequestMapping(value="/event/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="ecategoryCode", defaultValue="0") int ecategoryCode,
			@RequestParam(value="state", defaultValue="1") int state,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;

		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8"); 
		}
		// 전체 페이지 수
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("ecategoryCode", ecategoryCode);
		map.put("state", state);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
	    List<Event> list = service.listEvent(map);
	    
	    String query = "";
        String listUrl = cp+"/event/list?ecategoryCode="+ecategoryCode+"&state="+state;
        String articleUrl = cp+"/event/article?ecategoryCode="+ecategoryCode+"&page="+current_page+"&state="+state;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
	    
        if(query.length()!=0) {
        	listUrl+="&"+query;
        	articleUrl+="&"+query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
       
        model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("ecategoryCode", ecategoryCode);
		model.addAttribute("keyword", keyword);
		
		return ".event.list";
	}
	
	// 분류 등록
	@RequestMapping(value="/event/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		
		List<Event> list=service.listCategory();

		model.addAttribute("list", list);
		model.addAttribute("mode", "created");
		return ".event.created";
	}
	
	@RequestMapping(value="/event/article", method=RequestMethod.GET)
	public String article(
			@RequestParam int ecode,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"UTF-8");
		}
		
		Event dto = service.readEvent(ecode);
		if(dto==null)
			return "redirect:/event/list?"+query;
		
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		return ".event.article";
	}
	
	// 댓글 리스트 : AJAX-TEXT
		@RequestMapping(value="/event/listReply")
		public String listReply(
				@RequestParam int ecode,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				Model model
				) throws Exception {
			
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<>();
			map.put("ecode", ecode);
			
			dataCount=service.replyCount(map);
			total_page = myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
			List<Reply> listReply=service.listReply(map);
			
			for(Reply dto : listReply) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
			// AJAX용 페이징
			String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			
			// 포워딩할 jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			return "event/listReply";
		}
	
	
	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@RequestMapping(value="/event/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) {
		com.sp.member.SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 댓글 삭제
	@RequestMapping(value="/event/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		
		return map;	
	}
	
	// 댓글의 답글 개수
	@RequestMapping(value="/evetn/countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(
			@RequestParam(value="answer") int answer
			) {
		
		int count=service.replyAnswerCount(answer);
		
		Map<String, Object> model=new HashMap<>();
		model.put("count", count);
		
		return model;
	}
	// 댓글의 답글 리스트
	@RequestMapping(value="/event/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer,
			Model model
			) {
		
		List<Reply> listReplyAnswer=service.listReplyAnswer(answer);
		for(Reply dto : listReplyAnswer) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("listReplyAnswer", listReplyAnswer);
		return "event/listReplyAnswer";
	}
		
	
	
}
