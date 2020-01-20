package com.sp.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;
import com.sp.member.Member;

@Service("booking.bookingService")
public class BookingServiceImpl implements BookingService{
    @Autowired
    CommonDAO dao;
    
	@Override
	public List<Booking> scheduleList(Map<String, Object> map) throws Exception{
		List<Booking> list=null;
		
		try {
			list=dao.selectList("booking.scheduleList",map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public List<String> bookingSeatList(int scheduleCode) throws Exception {
		List<String> list=null;
		
		try {
			list=dao.selectList("booking.bookingSeatList",scheduleCode);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public Booking readSeat(int scheduleCode) throws Exception {
		Booking dto=null;
		
		try {
			dto=dao.selectOne("booking.readSeat",scheduleCode);
		} catch (Exception e) {
			throw e;
		}
		return dto;
	}

	@Override
	public int seatCount(int scheduleCode) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("booking.seatCount",scheduleCode);
		} catch (Exception e) {
			throw e;
		}
		return result;
	}

	@Override
	public List<SchedulePrice> bookingPrice(int scheduleCode) throws Exception {
		List<SchedulePrice> list=null;
		try {
			list=dao.selectList("booking.seatCount",scheduleCode);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public void customerInsert(Member dto) throws Exception {
		
		try {
			dto.setCustomerCode(dao.selectOne("member.memberSeq"));
			dao.insertData("member.insertMember1",dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public Member customerCheck(Member dto) throws Exception {
		Member dtt=null;
		
		try {
			dtt=dao.selectOne("booking.customerCheck",dto);
		} catch (Exception e) {
			throw e;
		}
		return dtt;
	}

	@Override
	public int bookingSeq() throws Exception {
		int seq=0;
		try {
			seq=dao.selectOne("booking.bookingSeq");
		} catch (Exception e) {
			throw e;
		}
		return seq;
	}

	@Override
	public void bookingInsert(BookingInfo bkif) throws Exception {
		
		
		try {
			
			dao.insertData("booking.insertBooking",bkif);
			for(int i=0;i<bkif.getSeatNumber().length;i++) {
				Map<String,Object> map =new HashMap<String, Object>();
				map.put("bookCode", bkif.getBookCode());
				map.put("seatNumber", bkif.getSeatNumber()[i]);
				dao.insertData("booking.insertSeat", map);
			}
			for(int v=0;v<bkif.getPdList().size();v++) {
				bkif.getPdList().get(v).setBookCode(bkif.getBookCode());
				dao.insertData("booking.insertBookingDetail",bkif.getPdList().get(v));
			}
			
		} catch (Exception e) {
			throw e;
		}
		
	}

}
