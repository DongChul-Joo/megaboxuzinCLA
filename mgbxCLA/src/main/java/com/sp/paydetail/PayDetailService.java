package com.sp.paydetail;

import java.util.List;
import java.util.Map;

import com.sp.booking.BookingInfo;



public interface PayDetailService  {
	public List<BookingInfo> listPayDetail(int bookCode) throws Exception;
	public void insertMileage(String userId,int mileage) throws Exception;
	public void canselBooking(Map<String,Object> map) throws Exception;
}
