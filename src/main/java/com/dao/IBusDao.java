package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import com.bean.Bus;

@Component("busDao")
public interface IBusDao {
	public int add(Bus bus);
	public List<Bus> findAll();
	public Bus findById(long id);
	public int update(Bus bus);
	public List<Bus> findByPage(@Param("startRow")int startRow,@Param("pageSize")int pageSize);
}
