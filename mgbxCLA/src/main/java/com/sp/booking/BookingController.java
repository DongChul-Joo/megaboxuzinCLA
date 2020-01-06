package com.sp.booking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("booking.bokingController")
public class BookingController {

	@RequestMapping(value="/booking/booking",method=RequestMethod.GET)
	public String bookingForm() {
		
		return ".booking.booking";
	}
}
