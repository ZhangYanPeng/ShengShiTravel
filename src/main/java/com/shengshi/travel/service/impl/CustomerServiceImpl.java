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
	@Transactional
	public Customer login(Customer customer) {
		// TODO Auto-generated method stub
		Object[] values = new Object[1];
		values[0] = customer.getOpenid();
		Customer c = customerDAO.getByHQL("from Customer c where c.openid=?", values);
		if( c!=null ){
			return c;
		}else{
			customer.setFocus(null);
			customer.setInformations(null);
			customerDAO.save(customer);
			c = customerDAO.getByHQL("from Customer c where c.openid=?", values);
			return c;
		}
	}

	@Override
	@Transactional
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
	@Transactional
	public Customer view(long id) {
		// TODO Auto-generated method stub
		return customerDAO.get(id);
	}

	@Override
	@Transactional
	public Customer edit(Customer customer) {
		// TODO Auto-generated method stub
		customerDAO.update(customer);
		return customer;
	}

	@Override
	@Transactional
	public List<Information> viewFocus(Customer customer) {
		// TODO Auto-generated method stub
		List list = new ArrayList();
		if(customer.getFocus()==null)
			return new ArrayList();
		String[] focus = customer.getFocus().split("@");
		for( String str: focus){
			list.add(imformationDAO.get(Long.valueOf(str)));
		}
		return list;
	}

	@Override
	@Transactional
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
