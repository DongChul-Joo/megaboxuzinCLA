package com.sp.mypage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.booking.BookingInfo;
import com.sp.common.MyUtil;
import com.sp.member.Member;
import com.sp.member.MemberService;
import com.sp.member.SessionInfo;
import com.sp.paydetail.PayDetailService;

@Controller("mypage.myPageController")
public class MyPageController {
	@Autowired
	private MyPageService service;
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private PayDetailService payService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/mypage/info")
	public String info(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String cp = req.getContextPath();
		int rows = 3; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		MyPage dto=null;
		MyPage dto1=null;
		List<MyPage> list = null;
		try {
			
			dto=service.listPoint(info.getUserId());
			dto1=service.listMembership(info.getUserId());
			
			Map<String, Object> map = new HashMap<>();		
			map.put("userId", info.getUserId());
			dataCount = service.dataCountMileage(map);
			
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
			
			
			list = service.listPoint2(map);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query = "";
		String listUrl = cp+"/mypage/info";
		String articleUrl = cp+"/mypage/info?page=" + current_page;
		if(query.length()!=0) {
        	listUrl = cp+"/mypage/info?" + query;
        	articleUrl = cp+"/mypage/info?page=" + current_page + "&"+ query;
        }
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
				
		model.addAttribute("list", list);
		model.addAttribute("subMenu", "1");
		model.addAttribute("dto", dto);
		model.addAttribute("dto1", dto1);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		return ".four.menu5.mypage.info";
	}
	
	@RequestMapping(value="/mypage/membership")
	public String membership(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCount(map);
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
			
			list = service.listReservation(map);
			

			Date nowDayTime = new Date();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // String 날짜 형식을 정의 합니다. 

			String nowDayTimeStr = sdf.format(nowDayTime);  // 현재일시를 같은 형식으로 파싱합니다.

			Date nowDayTimeFormat = sdf.parse(nowDayTimeStr);	// 시간으로 변경을 합니다
			
			
			int listNum = 0;
			for(MyPage dto : list) {
				listNum++;
				dto.setListNum(listNum);
				String cancel=dto.getShowingdate()+" "+dto.getStartTime();
				Date bookingCancelEnd=sdf.parse(cancel);
				
				if(((bookingCancelEnd.getTime()/1000/60)-10<nowDayTimeFormat.getTime()/1000/60)&&dto.getCancelInfo()!=1) {
					dto.setCancelInfo(2);
				}
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query = "";
		String listUrl = cp+"/mypage/membership";
		String articleUrl = cp+"/mypage/membership?page=" + current_page;
		if(query.length()!=0) {
        	listUrl = cp+"/mypage/membership?" + query;
        	articleUrl = cp+"/mypage/membership?page=" + current_page + "&"+ query;
        }
		
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".four.menu5.mypage.membership";
	}
	
	@RequestMapping(value="/mypage/store", method=RequestMethod.GET)
	public String store(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String cp = req.getContextPath();
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCountStore(map);
			
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
			
			
			
			list = service.listStore(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		String query = "";
		String listUrl = cp+"/mypage/store";
		String articleUrl = cp+"/mypage/store?page=" + current_page;
		if(query.length()!=0) {
        	listUrl = cp+"/mypage/store?" + query;
        	articleUrl = cp+"/mypage/store?page=" + current_page + "&"+ query;
        }
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("subMenu", "3");
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
		return ".four.menu5.mypage.store";
	}
	
	@RequestMapping(value="/mypage/store", method=RequestMethod.POST)
	public String storeSubmit(
			MyPage dto,
			HttpSession session,
			Model model) throws Exception {
		

		try {
			service.insertMyPage(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/mypage/store";
	}
	
	@RequestMapping(value="/mypage/mymoviestory")
	public String mymoviestory(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String cp = req.getContextPath();
		int rows = 4; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		
		List<MyPage> list = null;
		try {
			Map<String, Object> map = new HashMap<String, Object>();			
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCountMovie(map);
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
			
			list = service.listMyMovieStory(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String query = "";
		String listUrl = cp+"/mypage/mymoviestory";
		String articleUrl = cp+"/mypage/mymoviestory?page=" + current_page;
		if(query.length()!=0) {
        	listUrl = cp+"/mypage/mymoviestory?" + query;
        	articleUrl = cp+"/mypage/mymoviestory?page=" + current_page + "&"+ query;
        }
		
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("subMenu", "4");
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		return ".four.menu5.mypage.mymoviestory";
	}
	
	@RequestMapping(value="/mypage/bookingCancel",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> bookingCancel(
			HttpSession session,
			int bookCode) {
		
		Map<String,Object> map = new HashMap<>();

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info==null) {
			map.put("result", "false");
			map.put("state", "로그인이 되어있지않습니다.");
			return map;
		}
	
		
		List<MyPage> list = null;
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("bookCode", bookCode);
		maps.put("userId", info.getUserId());
		list = service.listReservation(maps);
		
		Date nowDayTime = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // String 날짜 형식을 정의 합니다. 

		String nowDayTimeStr = sdf.format(nowDayTime);  // 현재일시를 같은 형식으로 파싱합니다.

		Date nowDayTimeFormat;
		
		try {
			nowDayTimeFormat = sdf.parse(nowDayTimeStr);
			String cancel=list.get(0).getShowingdate()+" "+list.get(0).getStartTime();
			Date bookingCancelEnd=sdf.parse(cancel);
			
			
			if((bookingCancelEnd.getTime()/1000/60)-10<nowDayTimeFormat.getTime()/1000/60) {
				map.put("result", "false");
				map.put("state", "취소는 상영시간 10분 전까지만 가능합니다.");
				return map;
			}
			
			List<BookingInfo> plist=null;
			plist=payService.listPayDetail(bookCode);
			
			map.put("userId", info.getUserId());
			payService.canselBooking(maps);
			for(BookingInfo pd:plist) {
				if(pd.getPayKind().equals("mileage")) {
					payService.insertMileage(info.getUserId(), pd.getTotalPrice());
				}else if(pd.getPayKind().equals("Card")) {
					map.put("payCancelData", pd);
					map.put("result", "true");
				}
			}
			
			
			
		} catch (Exception e) {
			map.put("result", "false");
			e.printStackTrace();
		}	
		
		
		return map;
		
	}
	
	@RequestMapping(value="/mypage/memberCheck", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> memberCheck(
			HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			map.put("data", info);
		} else {
			Member dto = null;
			dto=memberService.readMember(info.getUserId());
			map.put("data", dto);
		}
		return map;
	}

}
