package com.sp.booking;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.common.dao.CommonDAO;

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

}
