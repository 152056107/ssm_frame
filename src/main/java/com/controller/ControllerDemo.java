package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bean.Bus;
import com.service.IBusService;

@Controller
public class ControllerDemo {
	@Autowired
	private IBusService busService;

	@RequestMapping("/index")
	public ModelAndView index() {

		ModelAndView mv = new ModelAndView();

		mv.setViewName("index");

		return mv;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String toHome() {
		return "home";
	}

	@RequestMapping(value = "/submit", method = RequestMethod.GET)
	@ResponseBody
	public String order(String str, long id) {
		busService.updateSeats(id, str);
		System.out.println(str + "  " + id);
		return "成功";
	}

	/*@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView toList() {
		List<Bus> allBus = busService.findAllBus();

		ModelAndView mv = new ModelAndView();
		mv.addObject("allBus", allBus);
		mv.setViewName("list");
		return mv;
	}*/

	@RequestMapping("/chooseSeat")
	public ModelAndView sendMessage() {

		ModelAndView mv = new ModelAndView("chooseSeat");
		mv.addObject("msg", "123");
		System.out.println("iframe来过了");
		return mv;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView findByPage(String page) {
		System.out.println(page);
		//每页显示个数
		int pageSize=8;	
		List<Bus> allBus = busService.findAllBus();
		//总页数
		int pageTimes;
		if(allBus.size()%pageSize==0) {
			pageTimes=allBus.size()/pageSize;
		}else {
			pageTimes=allBus.size()/pageSize+1;
		}
		if(page==null) {
			page="1";
		}
		int startRow=(Integer.parseInt(page)-1)*pageSize;
		allBus.clear();
		System.out.println("startRow:"+startRow+" pageSize:"+pageSize);
		allBus = busService.findByPage(startRow, pageSize);
		ModelAndView mv=new ModelAndView();
		mv.setViewName("list");
		mv.addObject("currentPage", Integer.parseInt(page));
		mv.addObject("pageTimes", pageTimes);
		for(Bus bus:allBus) {
			System.out.println(bus.getType());
		}
		mv.addObject("allBus", allBus);
		return mv;
	}

}
