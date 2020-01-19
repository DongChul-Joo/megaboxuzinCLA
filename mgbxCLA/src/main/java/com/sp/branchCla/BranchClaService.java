package com.sp.branchCla;

import java.util.List;

public interface BranchClaService {
	
	public List<BranchCla> listArea() throws Exception;
	
	public List<BranchCla> listBranch(int parent) throws Exception;
	
	public BranchCla readBranch(int branCode) throws Exception;
	
	public List<BranchSchdule> branScheduleList(int branCode) throws Exception;
	
}
