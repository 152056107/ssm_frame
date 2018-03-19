package com.service;

import java.util.List;

import com.bean.Bus;



public interface IBusService {
public void addBus() ;
	
	public List<Bus> findAllBus() ;
	
	public void updateSeats(long id,String seatsMessage);
	
	public List<Bus> findByPage(int startRow,int pageSize);
}
