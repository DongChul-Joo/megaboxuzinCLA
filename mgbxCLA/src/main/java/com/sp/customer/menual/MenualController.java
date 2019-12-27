package com.sp.customer.menual;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("menual.menaulController")
public class MenualController {
	@RequestMapping(value="/customer/menual/list")
	public String list() {
		return "customer/menual/menual";
	}
}
