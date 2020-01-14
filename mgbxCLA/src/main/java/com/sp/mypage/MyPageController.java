package com.sp.mypage;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("mypage.myPageController")
public class MyPageController {
	@Autowired
	private MyPageService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/mypage/info")
	public String info(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		MyPage dto=null;
		MyPage dto1=null;
		List<MyPage> list = null;
		try {
			
			dto=service.listPoint(info.getUserId());
			dto1=service.listMembership(info.getUserId());
			
			Map<String, Object> map = new HashMap<>();		
			map.put("userId", info.getUserId());
			list = service.listPoint2(map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		model.addAttribute("list", list);
		model.addAttribute("subMenu", "1");
		model.addAttribute("dto", dto);
		model.addAttribute("dto1", dto1);
		return ".four.menu5.mypage.info";
	}
	
	@RequestMapping(value="/mypage/membership")
	public String membership(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			list = service.listReservation(map);
			
			int listNum = 0;
			for(MyPage dto : list) {
				listNum++;
				dto.setListNum(listNum);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		model.addAttribute("subMenu", "2");
		model.addAttribute("list", list);
		return ".four.menu5.mypage.membership";
	}
	
	@RequestMapping(value="/mypage/store", method=RequestMethod.GET)
	public String store(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			list = service.listStore(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("subMenu", "3");
		model.addAttribute("list", list);
		return ".four.menu5.mypage.store";
	}
	
	@RequestMapping(value="/mypage/store", method=RequestMethod.POST)
	public String storeSubmit(
			MyPage dto,
			HttpSession session,
			Model model) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"myPage";
		
		try {
			service.insertMyPage(dto, path);
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/store";
	}
	
	@RequestMapping(value="/mypage/mymoviestory")
	public String mymoviestory(
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			list = service.listMyMovieStory(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("subMenu", "4");
		model.addAttribute("list", list);
		return ".four.menu5.mypage.mymoviestory";
	}
	

}
