package com.sp.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.myPageController")
public class MyPageController {
	
	@RequestMapping(value="/mypage/info")
	public String info(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		return ".four.menu5.mypage.info";
	}
	
	@RequestMapping(value="/mypage/membership")
	public String membership(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "2");
		return ".four.menu5.mypage.membership";
	}
}
