package com.sp.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1() != null && dto.getEmail1().length() != 0 && dto.getEmail2() != null
					&& dto.getEmail2().length() != 0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());

			if (dto.getTel1() != null && dto.getTel1().length() != 0 && dto.getTel2() != null
					&& dto.getTel2().length() != 0 && dto.getTel3() != null && dto.getTel3().length() != 0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());

			long memberSeq = dao.selectOne("member.memberSeq");
			dto.setCustomerCode(memberSeq);
			dto.setEnabled(1);

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
		// TODO Auto-generated method stub

	}

	@Override
	public void updateMember(Member dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Member readMember(String userId) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.readMember1", userId);
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

}
