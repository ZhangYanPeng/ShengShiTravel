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
		if( information == null )
			return 0;
		List iList = customer.getInformations();
		for( Object obj : iList){
			Information info = (Information) obj;
			if( info.getId() == information.getId() )
				return -1;
		}
		String focus = customer.getFocus();;
		if(type == Constants.add_focus){
			String[] strs = focus.split("@");
			int check =0;
			for( String str: strs){
				if( str.equals(""+information.getId())){
					check++;
				}
			}
			if( check==0 )
				focus += "@" + information.getId();
		}
		else{
			String[] strs = focus.split("@");
			focus = "";
			for( String str: strs){
				if( !str.equals(""+information.getId()) && !str.equals("")){
					focus += "@" + str;
				}
			}
		}
		customer.setFocus(focus);
		customerDAO.update(customer);
		return 1;
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
		String new_focus = "";
		for( String str: focus){
			if(!str.equals("")){
				try{
					Information info = imformationDAO.get(Long.valueOf(str));
					if(info!=null){
						list.add(info);
						new_focus += "@" + str;
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
		}
		customer.setFocus(new_focus);
		customerDAO.update(customer);
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
		if(information.getId()==-1)
			imformationDAO.save(information);
		else
			imformationDAO.update(information);
		return 1;
	}

}
