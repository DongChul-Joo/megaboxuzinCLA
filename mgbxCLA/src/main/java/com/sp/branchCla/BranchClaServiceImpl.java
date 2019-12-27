package com.sp.branchCla;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

@Service("branchCla.branchClaServie")
public class BranchClaServiceImpl implements BranchClaService{
	@Autowired
	private CommonDAO dao;

	@Override
	public List<BranchCla> listArea() throws Exception {
		List<BranchCla> list=null;
		try {
			list=dao.selectList("branchCla.listArea");
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<BranchCla> listBranch(int parent) throws Exception {
		List<BranchCla> list=null;
		try {
			list=dao.selectList("branchCla.listBranch",parent);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public BranchCla readBranch(int branCode) throws Exception {
		BranchCla dto=null;
		try {
			dto=dao.selectOne("branchCla.readBranch",branCode);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

}
