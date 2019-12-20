package com.sp.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public void insertMember(Member dto) throws Exception;
	
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member readMember(String userId);
	public Member readMember(long customerCode);
	public Member readMember2(String email);
	
		
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public void generatePwd(Member dto) throws Exception;
	public void generateId(Member dto) throws Exception;
}
