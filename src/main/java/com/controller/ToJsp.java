package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ToJsp {
	
	@RequestMapping("/list.jsp")
	public String toList() {
		return "list";
	}
	@RequestMapping(value="/seat_detail",method = RequestMethod.GET)
	public ModelAndView toSeatDetail(long busId,String seatsMessage) {
		ModelAndView mv=new ModelAndView();
		mv.addObject("busId", busId);
		System.out.println("id:"+busId+"   seats:"+seatsMessage);
		 String[] seats = seatsMessage.split(" ");
		mv.addObject("seats", seats);
		mv.setViewName("seat_detail");
		return mv;
	}
	
}
