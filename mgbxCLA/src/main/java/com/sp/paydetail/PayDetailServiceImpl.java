package com.sp.paydetail;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.booking.BookingInfo;
import com.sp.common.dao.CommonDAO;

@Service("payDetail.Service")
public class PayDetailServiceImpl implements PayDetailService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<BookingInfo> listPayDetail(int bookCode) throws Exception {
		List<BookingInfo> list=null;
		try {
			list=dao.selectList("payDetail.listPayDetail",bookCode);
		} catch (Exception e) {
			throw e;
		}
		return list;
	}

	@Override
	public void insertMileage(String userId,int mileage) throws Exception {
		try {
			dao.insertData("payDetail.insertMileage",mileage);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void canselBooking(Map<String,Object> map) throws Exception {
		try {
			
			dao.updateData("payDetail.bookingCancel",map);
		} catch (Exception e) {
			throw e;
		}
		
	}

}
