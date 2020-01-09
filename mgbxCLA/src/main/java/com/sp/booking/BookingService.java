package com.sp.booking;

import java.util.List;
import java.util.Map;

public interface BookingService {
	
	public List<Booking> scheduleList(Map<String, Object> map) throws Exception;
}
