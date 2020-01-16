package com.sp.booking;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.branchCla.BranchCla;
import com.sp.branchCla.BranchClaService;
import com.sp.member.Member;
import com.sp.member.MemberService;
import com.sp.member.SessionInfo;
import com.sp.movie.Movie;
import com.sp.movie.MovieService;

@Controller("booking.bokingController")
public class BookingController {
	@Autowired private MovieService movieService;
	@Autowired private BranchClaService branchService;
	@Autowired private BookingService bookingService;
	@Autowired private MemberService memberService;

	@RequestMapping(value="/booking/booking",method=RequestMethod.GET)
	public String bookingForm(
			Model model
			) {
		
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		

		int offset = 0;
        map.put("offset", offset);
        map.put("rows", dataCount);
		
       
        List<Movie> movieList = null;   
        List<BranchCla> areaList=null;
        try {
           areaList=branchService.listArea();
     
           movieList =movieService.readMovie(map);
        } catch (Exception e) {
           return "redirect:/error/dataAccessFailure";
        }
        
        model.addAttribute("areaList",areaList);
        model.addAttribute("movieList", movieList);
        
        
        
	
		return "booking/booking";
	}
	
	@RequestMapping(value="/booking/scheduleList",method=RequestMethod.GET)
	@ResponseBody
	public List<Booking> scheduleList(
			String movieCode[],
			int branCode[],
			@RequestParam String date
			) {
		List<Booking> list=null;
		Map<String,Object> map=new HashMap<>();


		map.put("date", date);

		map.put("branCode", branCode);
		map.put("movieCode", movieCode);
		
		String selDay=null;
		
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd");
		Date day = new Date();
		String toDay = format.format(day);
		if(date.equals(toDay)) {
			selDay="today";
			SimpleDateFormat format2 = new SimpleDateFormat ( "HH:mm");
			String time = format2.format(day);
			map.put("time", time);
		}
		
		map.put("today", selDay);
		
		try {
			list=bookingService.scheduleList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@RequestMapping(value="/booking/readSeat",method=RequestMethod.GET)
	public String readSeat(
			int scheduleCode
			,Model model
			) {

		
		Booking dto=null;
		List<String> bookingSeatList=null;
		List<SchedulePrice> priceList=null;
		try {
			dto=bookingService.readSeat(scheduleCode);
			bookingSeatList=bookingService.bookingSeatList(scheduleCode);
			priceList=bookingService.bookingPrice(scheduleCode);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("bookingSeatList", bookingSeatList);
		model.addAttribute("priceList", priceList);
		
		return "booking/bookingSeat";
	}
	
	@RequestMapping(value="/booking/logincheck",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> loginCheck(
			HttpSession session
			) {
		Map<String,Object> map=new HashMap<>();
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			map.put("data", info);
		}else {
			Member dto=null;
			dto=memberService.readMember(info.getUserId());
			map.put("data", dto);
		}
		
		return map;
	}
	
	@RequestMapping(value="/booking/nmemSelectForm",method=RequestMethod.GET)
	public String nmemSelectForm() {
		return "booking/bookingLoginSelect";
	}
	
	@RequestMapping(value="/booking/nmemLoginForm",method=RequestMethod.GET)
	public String nmemLoginForm() {
		return "booking/noMemberLogin";
	}
	
	@RequestMapping(value="/booking/noMemSubMit",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> noMemSubMit(Member dto) {
		
		dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
		dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
		Member dtt=null;
		try {
		
			dtt=bookingService.customerCheck(dto);
			
			if(dtt!=null) {
				
			}else {
				bookingService.customerInsert(dto);
				dtt=bookingService.customerCheck(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String,Object> map=new HashMap<>();
		map.put("data", dtt);
		return map;
	}
	
	@RequestMapping(value="/booking/bookingTiketingForm",method=RequestMethod.GET)
	public String bookingTiketingForm() {
		
		return "booking/bookingTiketing";
	}
}
