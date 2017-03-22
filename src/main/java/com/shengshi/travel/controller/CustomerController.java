package com.shengshi.travel.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shengshi.travel.entity.Customer;
import com.shengshi.travel.entity.Information;
import com.shengshi.travel.service.CustomerService;

@Controller
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Customer customer){
		Customer c = customerService.login(customer);
		session.setAttribute("customer", c);
		return "";
	}

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String view(Customer customer){
		Customer c = customerService.login(customer);
		session.setAttribute("customer", c);
		return "";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(Customer customer){
		Customer c = customerService.edit(customer);
		session.setAttribute("customer", c);
		return "";
	}
	
	@RequestMapping(value = "/view_publishment", method = RequestMethod.POST)
	public String view_publishment(HttpServletRequest request, Customer customer){
		request.setAttribute("publishments", customerService.viewInformation(customer));
		return "";
	}
	
	@RequestMapping(value = "/view_focus", method = RequestMethod.POST)
	public String view_focus(HttpServletRequest request, Customer customer){
		request.setAttribute("focuses",customerService.viewFocus(customer));
		return "";
	}
	
}
