package com.shengshi.travel.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shengshi.travel.constants.Constants;
import com.shengshi.travel.dao.impl.CustomerDAOImpl;
import com.shengshi.travel.dao.impl.InformationDAOImpl;
import com.shengshi.travel.entity.Customer;
import com.shengshi.travel.entity.Information;
import com.shengshi.travel.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	CustomerDAOImpl customerDAO;
	@Autowired
	InformationDAOImpl imformationDAO;

	@Override
	public Customer login(Customer customer) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public int focus(Customer customer, Information information, int type) {
		// TODO Auto-generated method stub
		String focus = customer.getFocus();
		if(type == Constants.add_focus){
			focus += "@" + information.getId();
			customer.setFocus(focus);
		}
		else{
			String[] strs = focus.split("@");
			focus = "";
			for( String str: strs){
				if( !str.equals(""+information.getId())){
					focus += "@" + information.getId();
				}
			}
		}
		customer.setFocus(focus);
		customerDAO.update(customer);
		return 0;
	}

	@Override
	public Customer view(long id) {
		// TODO Auto-generated method stub
		return customerDAO.get(id);
	}

	@Override
	public Customer edit(Customer customer) {
		// TODO Auto-generated method stub
		customerDAO.update(customer);
		return customer;
	}

	@Override
	public List<Information> viewFocus(Customer customer) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		String[] focus = customer.getFocus().split("@");
		for( String str: focus){
			list.add(imformationDAO.get(Long.valueOf(str)));
		}
		return list;
	}

	@Override
	public List<Information> viewInformation(Customer customer) {
		// TODO Auto-generated method stub
		return customer.getInformations();
	}

	@Override
	@Transactional
	public int publish(Customer customer, Information information) {
		// TODO Auto-generated method stub
		information.setCustomer(customer);
		customerDAO.update(customer);
		imformationDAO.save(information);
		return 0;
	}

}
