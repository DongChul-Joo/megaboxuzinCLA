package com.sp.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sp.common.MyUtil;

@Controller("member.memberController")
public class MemberController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired 
	private BCryptPasswordEncoder bcryptEncoder;
	
	@RequestMapping(value="/member/member", method=RequestMethod.GET)
	public String memberForm(Model model) {
		// 회원가입 폼 
		
		model.addAttribute("mode", "member");
		return ".member.member";
	}

	@RequestMapping(value="/member/member", method=RequestMethod.POST)
	public String memberSubmit(Member dto,
			final RedirectAttributes reAttr,
			Model model) {

		try {
			//패스워드 암호화 
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			service.insertMember(dto);
		} catch (Exception e) {
			model.addAttribute("mode", "member");
			model.addAttribute("message", "아이디 중복으로 회원가입이 실패했습니다.");
				
			return ".member.member";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		 // 리다이렉트된 페이지에 값 넘기기
        reAttr.addFlashAttribute("message", sb.toString());
        reAttr.addFlashAttribute("title", "회원 가입");
		
		return "redirect:/member/complete";
	}
	
	@RequestMapping(value="/member/complete")
	public String complete(@ModelAttribute("message") String message) throws Exception{
		
		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다. 
		// F5를 눌러 새로 고침을 하면 null이 된다.
		
		if(message==null || message.length()==0) // F5를 누른 경우
			return "redirect:/";
		
		return ".member.complete";
	}
	
	@RequestMapping(value="/member/login")
	public String loginForm(String login_error, Model model) {
		//로그인 폼 
		boolean bLoginError = login_error != null;
		String msg="";
		if(bLoginError) {
			msg = "아이디 또는 패스워드가 일치 하지 않습니다.";
			model.addAttribute("message" , msg);
			
		}
		
		// 로그인 폼
		return ".member.login";
	}
	

	@RequestMapping(value="/member/noAuthorized")
	public String noAuth() {
		//접근 권한이 없는 경우 
		return ".member.noAuthorized";
		
	}
	
	
	@RequestMapping(value="/member/expired")
	public String expired() {
		//세션이 만료된 경우 
		return ".member.expired";
		
	}
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.GET)
	public String pwdForm(
			String dropout,
			Model model) {
		
		if(dropout==null) {
			model.addAttribute("mode", "update");
		} else {
			model.addAttribute("mode", "dropout");
		}
		
		return ".member.pwd";
	}
	
	@RequestMapping(value="/member/pwd", method=RequestMethod.POST)
	public String pwdSubmit(
			@RequestParam String userPwd,
			@RequestParam String mode,
			final RedirectAttributes reAttr,
			Model model,
			HttpSession session
	     ) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Member dto=service.readMember(info.getUserId());
//		System.out.println(dto.toString());
		
		if(dto==null) {
			session.invalidate();
			return "redirect:/";
		}
		
		// 패스워드 검사 
		boolean bPwd = bcryptEncoder.matches(userPwd, dto.getUserPwd());
		
		
		if(! bPwd) {
			if(mode.equals("update")) {
				model.addAttribute("mode", "update");
			} else {
				model.addAttribute("mode", "dropout");
			}
			model.addAttribute("message", "패스워드가 일치하지 않습니다.");
			return ".member.pwd";
		}
		
		if(mode.equals("dropout")){
			// 게시판 테이블등 자료 삭제
			
			// 회원탈퇴 처리
			/*
			Map<String, Object> map = new HashMap<>();
			map.put("memberIdx", info.getMemberIdx());
			map.put("userId", info.getUserId());
			*/

			// 세션 정보 삭제
			session.removeAttribute("member");
			session.invalidate();

			StringBuilder sb=new StringBuilder();
			sb.append(dto.getUserName()+ "님의 회원 탈퇴 처리가 정상적으로 처리되었습니다.<br>");
			sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
			
			reAttr.addFlashAttribute("title", "회원 탈퇴");
			reAttr.addFlashAttribute("message", sb.toString());
			
			return "redirect:/member/complete";
		}

		// 회원정보수정폼
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		return ".member.member";
	}

	@RequestMapping(value="/member/update", method=RequestMethod.POST)
	public String updateSubmit(
			Member dto,
			final RedirectAttributes reAttr,
			Model model) {
		
		try {
			// 패스워드 암호화
			dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
			dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
			
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			
			service.updateMember(dto);
		} catch (Exception e) {
		}
		
//		StringBuilder sb=new StringBuilder();
//		sb.append(dto.getUserName()+ "님의 회원정보가 정상적으로 변경되었습니다.<br>");
//		sb.append("메인화면으로 이동 하시기 바랍니다.<br>");
//		
//		reAttr.addFlashAttribute("title", "회원 정보 수정");
//		reAttr.addFlashAttribute("message", sb.toString());
//		
		return "redirect:/member/complete";
	}

	// @ResponseBody : 자바 객체를 HTTP 응답 몸체로 전송(AJAX에서 JSON 전송 등에 사용)
	@RequestMapping(value="/member/userIdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(
			@RequestParam String userId
			) throws Exception {
		
		String p="true";
		Member dto=service.readMember(userId);
		if(dto!=null)
			p="false";
		
		Map<String, Object> model=new HashMap<>();
		model.put("passed", p);
		return model;
	}
	
	@RequestMapping(value="/member/pwdFind", method=RequestMethod.GET)
	public String pwdFindForm(HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info!=null) {
			return "redirect:/";
		}
		
		return ".member.pwdFind";
	}
	
	@RequestMapping(value="/member/pwdFind", method=RequestMethod.POST)
	public String pwdFindSubmit(
			@RequestParam String userId,
			final RedirectAttributes reAttr,
			Model model
			) throws Exception {
		
		Member dto = service.readMember(userId);
		if(dto==null || dto.getEmail()==null || dto.getEnabled()==0) {
			model.addAttribute("message", "등록된 아이디가 아닙니다.");
			return ".member.pwdFind";
		}
		
		try {
			
			service.generatePwd(dto);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".member.pwdFind";			
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("회원님의 이메일로 임시패스워드를 전송했습니다.<br>");
		sb.append("로그인 후 패스워드를 변경하시기 바랍니다.<br>");
		
		reAttr.addFlashAttribute("title", "패스워드 찾기");
		reAttr.addFlashAttribute("message", sb.toString());
		
		return "redirect:/member/complete";
	}
	
	@RequestMapping(value="/member/idFind", method=RequestMethod.GET)
	public String idFindForm(HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info!= null) {
			return "redirect:/";
		}
		return ".member.idFind";
	}
	
	@RequestMapping(value="/member/idFind", method=RequestMethod.POST)
	public String idFindSubmit(@RequestParam String email,
			final RedirectAttributes reAttr,
			Model model
			) throws Exception {
		
		Member dto = service.readMember2(email);
		if(dto==null || dto.getEnabled()==0) {
			model.addAttribute("message", "등록된 이메일이 아닙니다.");
			return ".member.idFind";
		}
		
		try {
			service.generateId(dto);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "이메일 전송이 실패했습니다.");
			return ".member.idFind";
		}
		
		StringBuilder sb=new StringBuilder();
		sb.append("회원님의 이메일로 아이디를 전송했습니다.<br>");
		
		reAttr.addFlashAttribute("title", "아이디 찾기");
		reAttr.addFlashAttribute("message", sb.toString());

		return "redirect:/member/complete";
	}
	
	@RequestMapping(value="/member/nonmembers", method=RequestMethod.GET)
	public String nonmemberReservationForm() {
		
		return ".member.nonmembers";
	}
	
	@RequestMapping(value="/member/nonmembers", method=RequestMethod.POST)
	public String nonmemberReservationSubmit(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			@RequestParam Map<String, Object> paramMap,
			Model model
			) { 
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		 
		List<Member> list = null;
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();	
			
			dataCount = service.dataCountNonMember(map);
			if(dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);
			
			// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
	        if(total_page < current_page) 
	            current_page = total_page;

	        // 리스트에 출력할 데이터를 가져오기
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
			
			
		list = service.listNonMember(paramMap);
			if(list.size()==0) {
				return ".member.nonmembers"; 
			} 
			
			
			int listNum = 0;
			for(Member dto : list) {
				listNum++;
				dto.setListNum(listNum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		String query = "";
		String listUrl = cp+"/mypage/nonmembersCheck";
		String articleUrl = cp+"/mypage/nonmembersCheck?page=" + current_page;
		if(query.length()!=0) {
        	listUrl = cp+"/mypage/nonmembersCheck?" + query;
        	articleUrl = cp+"/mypage/nonmembersCheck?page=" + current_page + "&"+ query;
        }
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		return ".member.nonmembersCheck";
	} 
}
