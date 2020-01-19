package com.sp.branchCla;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller("branchCla.branchClaController")
public class BranchClaController {
	@Autowired
	private BranchClaService service;

	@RequestMapping(value="/branchCla/branchCla",method=RequestMethod.GET)
	public String branchForm(
			Model model
			) {
		BranchCla dto=null;
		List<BranchCla> areaList=null;
		List<BranchCla> branchList=null;
		try {
			
			areaList=service.listArea();
			branchList=service.listBranch(areaList.get(0).getParent());
			dto=service.readBranch(areaList.get(0).getParent());
		} catch (Exception e) {
			return "redirect:/error/dataAccessFailure";
		}
		model.addAttribute("dto",dto);
		model.addAttribute("areaList",areaList);
		model.addAttribute("branchList",branchList);
		return ".branchCla.branchCla";
	}
	
	
	@RequestMapping(value="/branchCla/list",method=RequestMethod.GET)
	@ResponseBody
	public List<BranchCla> listBranch(
			@RequestParam(defaultValue="0") int parent
			,Model model
			) {
		
		List<BranchCla> branchList=null;
		try {
			branchList=service.listBranch(parent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("branchList",branchList);
		
		return branchList;
	}
	
	@RequestMapping(value="/branchCla/article",method=RequestMethod.GET)
	public String articleBranch(
			@RequestParam(defaultValue="0") int branCode
			,Model model
			) {
		
		BranchCla dto=null;
		List<BranchSchdule> list=null;
		try {
			dto=service.readBranch(branCode);
			list=service.branScheduleList(branCode);
			for(BranchSchdule dtt:list) {
				dtt.setStartTime(dtt.getStartTimes().split("/"));
				dtt.setSeatCount(dtt.getSeatCounts().split("/"));
			}
		} catch (Exception e) {
			return "redirect:/error/dataAccessFailure";
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
		return "branchCla/article";
	}
	
}
