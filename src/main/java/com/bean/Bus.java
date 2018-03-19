package com.bean;



public class Bus {
	private Long id;
	private String type;
	private int total;
	private int last;
	private String seatsMessage;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSeatsMessage() {
		return seatsMessage;
	}
	public void setSeatsMessage(String seatsMessage) {
		this.seatsMessage = seatsMessage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	
	
}
