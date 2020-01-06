package com.sp.customer.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.common.FileManager;
import com.sp.common.MyUtil;
import com.sp.member.SessionInfo;

@Controller("customer.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/customer/notice/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Notice> list = service.listNotice(map);
		
		int fileNum, n = 0;
		for(Notice dto : list) {
			fileNum = dataCount - (offset + n);
			dto.setFileNum(fileNum);
			
			dto.setCreated(dto.getCreated().substring(0, 10));
			
			n++;
			
		}
		
		String paging = myUtil.paging(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "customer/notice/list";
	}
	
	@RequestMapping(value="/customer/notice/created", method=RequestMethod.GET)
	public String createdForm(
			HttpSession session,
			Model model) throws Exception {
		
		/*SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(! info.getUserId().equals("admin")) {
			return "redirect:/customer/notice/list";
		}*/
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		return "customer/notice/created";
	}
	
	@RequestMapping(value="/customer/notice/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Notice dto,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state="false";
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		dto.setUserId(info.getUserId());
		service.insertNotice(dto, pathname);
		state="true";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customer/notice/article")
	public String article(
			@RequestParam int code,
			@RequestParam String pageNo,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "UTF-8");
		
		String query="pageNo="+pageNo;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Notice dto = service.readNotice(code);
		if(dto==null) {
			return "redirect:/customer/notice/list?"+query;
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("code", code);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		List<Notice> listFile=service.listFile(code);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("query", query);
		
		return "customer/notice/article";
	}
	
	@RequestMapping(value="/customer/notice/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int code,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Notice dto = service.readNotice(code);
		if(dto==null) {
			return "customer/error";
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			return "customer/error";
		}
		
		List<Notice> listFile = service.listFile(code);
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return "customer/notice/created";
	}
	
	@RequestMapping(value="/customer/notice/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Notice dto,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		if(info.getUserId().equals("admin")) {
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "notice";
				
				dto.setUserId(info.getUserId());
				service.updateNotice(dto, pathname);
				state="true";
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/customer/notice/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b = false;
		
		Notice dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if(!b) {
			try {
				resp.setContentType("text/html; charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('다운로드가 불가능 합니다.');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="/customer/notice/zipdownload")
	public void zip(
			@RequestParam int code,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		boolean b=false;
		List<Notice> list = service.listFile(code);
		
		if(list.size() > 0) {
			String []sources = new String[list.size()];
			String []originals = new String[list.size()];
			String zipFilename = code+".zip";
			
			for(int idx=0; idx < list.size(); idx++) {
				sources[idx] = pathname+File.separator+list.get(idx).getSaveFilename();
				originals[idx] = File.separator+list.get(idx).getOriginalFilename();
			}
			b=  fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}
		if(! b) {
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>alert('다운받을 수 없습니다.');history.back();</script>");
		}
	}
	
	@RequestMapping(value="/customer/notice/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		String state="false";
		Notice dto = service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		
			Map<String, Object> map = new HashMap<>();
			map.put("field", "fileNum");
			map.put("code", fileNum);
			
			try {
				service.deleteFile(map);
				state="true";
			} catch (Exception e) {
			}
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
			
		return model;
	}
	
	@RequestMapping(value="/customer/notice/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int code,
			HttpSession session) throws Exception {
		/*SessionInfo info=(SessionInfo)session.getAttribute("member");*/
		String state="false";
		
			try {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "notice";
				service.deleteNotice(code, pathname);
				state="true";
			} catch (Exception e) {
			}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
	
		return model;
	}
}
