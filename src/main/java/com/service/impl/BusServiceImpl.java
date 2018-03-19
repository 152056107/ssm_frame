package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bean.Bus;
import com.dao.IBusDao;
import com.service.IBusService;

@Service("busService")
public class BusServiceImpl implements IBusService{
	@Autowired
	private IBusDao busDao;
	
	@Transactional
	public void addBus() {
		Bus bus=new Bus();
		bus.setId(1l);
		bus.setType("豪华大巴");
		bus.setSeatsMessage("1 0 0 0 1");
		busDao.add(bus);
	}
	
	public List<Bus> findAllBus() {
		List<Bus> buses = busDao.findAll();
		return buses;
	}

	@Override
	public void updateSeats(long id, String seatsMessage) {
		String[] index = seatsMessage.split(" ");
		Bus bus=busDao.findById(id);
		bus.setLast(bus.getLast()-index.length);
		String[] seats = bus.getSeatsMessage().split(" ");
		for(String i:index) {
			seats[Integer.parseInt(i)]=1+"";
		}
		String newMessage="";
		for(String i:seats) {
			newMessage+=i+" ";
		}
		bus.setSeatsMessage(newMessage.trim());;
		
		busDao.update(bus);
		
	}

	@Override
	public List<Bus> findByPage(int startRow, int pageSize) {
		System.out.println(startRow+" "+pageSize);
		List<Bus> list = busDao.findByPage(startRow, pageSize);
		return list;
	}
}
