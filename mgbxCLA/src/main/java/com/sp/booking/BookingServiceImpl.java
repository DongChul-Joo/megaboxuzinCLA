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
			list=dao.selectList("scheduleList",map);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

}