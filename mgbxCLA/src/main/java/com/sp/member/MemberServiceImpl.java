package com.sp.member;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.mail.Mail;
import com.sp.mail.MailSender;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private MailSender mailSender;

	@Autowired 
	private BCryptPasswordEncoder bcryptEncoder;
	
	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1() != null && dto.getEmail1().length() != 0 && dto.getEmail2() != null
					&& dto.getEmail2().length() != 0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());

			if (dto.getTel1() != null && dto.getTel1().length() != 0 && dto.getTel2() != null
					&& dto.getTel2().length() != 0 && dto.getTel3() != null && dto.getTel3().length() != 0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());

			int memberSeq = dao.selectOne("member.memberSeq");
			
			
			dto.setCustomerCode(memberSeq);
			dto.setEnabled(1);
			dto.setMembershipCode(1);

			// 회원정보 저장
			dao.insertData("member.insertMember1", dto); // CUSTOMER 저장
			
			dao.insertData("member.insertMember2", dto); // MEMBER 저장

			// 권한 저장
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		
		try {
			dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if(dto.getEmail1() != null && dto.getEmail1().length()!=0 &&
					dto.getEmail2() != null && dto.getEmail2().length()!=0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			
			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
					dto.getTel2() != null && dto.getTel2().length()!=0 &&
							dto.getTel3() != null && dto.getTel3().length()!=0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dao.updateData("member.updateMember1", dto);
			dao.updateData("member.updateMember2", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember1", userId);
			
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if(dto.getTel()!=null) {
					String [] s=dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Member readMember(long customerCode) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember2", customerCode);
			
			
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if(dto.getTel()!=null) {
					String [] s=dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
				StringBuilder sb = new StringBuilder();
				Random rd = new Random();
				String s="!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
				for(int i=0; i<10; i++) {
					int n = rd.nextInt(s.length());
					sb.append(s.substring(n, n+1));
				}
				
				String result;
				result = dto.getUserId()+"님의 새로 발급된 임시 패스워드는 <b>"
				         + sb.toString()+"</b> 입니다.<br>"
				         + "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";
				
				Mail mail = new Mail();
				mail.setReceiverEmail(dto.getEmail());
				
				mail.setSenderEmail("clsrnemfdml@gmail.com");
				mail.setSenderName("관리자");
				mail.setSubject("임시 패스워드 발급");
				mail.setContent(result);
				
				boolean b = mailSender.mailSend(mail);
				
				if(b) {
					String encPwd = bcryptEncoder.encode(sb.toString());
					dto.setUserPwd(encPwd);
	
					updateMember(dto);
				} else {
					throw new Exception("이메일 전송중 오류가 발생했습니다.");
				}
		
	}

	@Override
	public void generateId(Member dto) throws Exception {
		
		String result;
		result = "고객님의 아이디는"+ dto.getUserId()+"입니다.";
		
		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getEmail());
		
		mail.setSenderEmail("clsrnemfdml@gmail.com");
		mail.setSenderName("관리자");
		mail.setSubject("아이디 발급");
		mail.setContent(result);
		
		mailSender.mailSend(mail);
			
	}

	@Override
	public Member readMember2(String email) {
		Member dto = null;
		try {
			dto = dao.selectOne("member.readMember3" , email);
						
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if(dto.getTel()!=null) {
					String [] s=dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return dto;
	}

	@Override
	public Member readNonMember(Map<String, Object> map) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readNonMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<Member> listNonMember(Map<String, Object> map) {
		List<Member> list = null;
		
		try {
			list =dao.selectList("member.listNonMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
