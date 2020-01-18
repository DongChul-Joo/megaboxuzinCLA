package com.sp.booking;

import java.util.List;
import java.util.Map;

import com.sp.member.Member;

public interface BookingService {
	
	public List<Booking> scheduleList(Map<String, Object> map) throws Exception;
	public List<String> bookingSeatList(int scheduleCode) throws Exception;
	public Booking readSeat(int scheduleCode) throws Exception;
	public int seatCount(int scheduleCode) throws Exception;
	public List<SchedulePrice> bookingPrice(int scheduleCode) throws Exception;
	public void customerInsert(Member dto) throws Exception;
	public Member customerCheck(Member dto) throws Exception;
	
	public int bookingSeq() throws Exception;
	public void bookingInsert(BookingInfo bkif) throws Exception;
}
