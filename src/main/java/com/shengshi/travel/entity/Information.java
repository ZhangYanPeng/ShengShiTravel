package com.shengshi.travel.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "t_information")
public class Information {
	
	@Id
	@GeneratedValue(generator = "infogenerator")
	@GenericGenerator(name = "infogenerator", strategy = "increment")
	private long id;
	
	private int type;//有顺车，搭顺车
	private Date publish_time;
	private Date start_time;
	
	private String startpos;
	private String destination;
	
	private int capacity;
	private int set_num;
	private double distance;
	private double time;//消耗时间
	private double road_toll; //过路费
	private String remarks;
	private String contact;
	private String contact_info;
	

	@ManyToOne(fetch = FetchType.LAZY)
	@JsonIgnore
	private Customer customer;

	public Information() {
		super();
	}
	
	public Information(long id) {
		super();
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getPublish_time() {
		return publish_time;
	}

	public void setPublish_time(Date publish_time) {
		this.publish_time = publish_time;
	}

	public Date getStart_time() {
		return start_time;
	}

	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getSet_num() {
		return set_num;
	}

	public void setSet_num(int set_num) {
		this.set_num = set_num;
	}

	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	public double getTime() {
		return time;
	}

	public void setTime(double time) {
		this.time = time;
	}

	public double getRoad_toll() {
		return road_toll;
	}

	public void setRoad_toll(double road_toll) {
		this.road_toll = road_toll;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getContact_info() {
		return contact_info;
	}

	public void setContact_info(String contact_info) {
		this.contact_info = contact_info;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getStartpos() {
		return startpos;
	}

	public void setStartpos(String startpos) {
		this.startpos = startpos;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}
	
	

}
