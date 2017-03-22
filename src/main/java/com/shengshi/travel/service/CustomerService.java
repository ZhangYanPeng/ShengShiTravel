package com.shengshi.travel.service;

import java.util.List;

import com.shengshi.travel.entity.Customer;
import com.shengshi.travel.entity.Information;

public interface CustomerService{
	
	public Customer login(Customer customer);
	public int focus(Customer customer, Information information, int type);
	public int publish(Customer customer, Information information);
	public Customer view(long id);
	public Customer edit(Customer customer);
	public List<Information> viewFocus(Customer customer);
	public List<Information> viewInformation(Customer customer);
}