package com.sp.security;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.sp.member.Member;
import com.sp.member.MemberService;
import com.sp.member.SessionInfo;

// 로그인 성공후 세션 및 쿠키등의 처리를 할 수 있다.
// 로그인 전 정보를 Cache : 로그인 되지 않은 상태에서 로그인 상태에서만 사용할 수 있는 페이지로 이동할 경우 로그인 페이지로 이동하고 로그인 후 로그인 전 페이지로 이동
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();
	
	@Autowired
	private MemberService memberService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req,
			HttpServletResponse resp, Authentication authentication)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		
		// System.out.println(authentication.getName()); // 로그인 아이디
		
		try {
			// 로그인 날짜 변경
			memberService.updateLastLogin(authentication.getName());
		} catch (Exception e) {
		}
		
		// 로그인 정보 저장
		Member member=memberService.readMember(authentication.getName());
		SessionInfo info=new SessionInfo();
		info.setUserId(member.getUserId());
		info.setUserName(member.getUserName());
		
		session.setAttribute("member", info);	
		
		
		try {
			 Date endDate = new Date();
		        long gap;
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	            Date modifyDate = formatter.parse(member.getModify_date());
	            gap=(endDate.getTime() - modifyDate.getTime()) / (24 * 60 * 60* 1000);
	            if(gap >= 90) {
	            	// 패스워드 변경이 90일 이상인 경우
	            	String targetUrl = "/member/updatePwd";
	            	redirectStratgy.sendRedirect(req, resp, targetUrl);
	            	return;
	            }
		} catch (Exception e) {
			
		} 

		super.onAuthenticationSuccess(req, resp, authentication);
	}
}
