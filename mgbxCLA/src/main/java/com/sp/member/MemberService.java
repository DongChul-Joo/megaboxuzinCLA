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
	public Member readNonMember(Map<String, Object> map);
	public List<Member> listNonMember(Map<String, Object> map);
	
	public void deleteMember(Map<String, Object> map) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public void generatePwd(Member dto) throws Exception;
	public void generateId(Member dto) throws Exception;
	public int dataCountNonMember(Map<String, Object> map);
	
	public int checkFailureCount(String userId);
	public void updateFailureCount(String userId) throws Exception;
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	public List<Member> listMemberState(String userId);
	public Member readMemberState(String userId);
	

}
