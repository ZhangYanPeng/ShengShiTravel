package com.shengshi.travel.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shengshi.travel.entity.Customer;
import com.shengshi.travel.entity.Information;
import com.shengshi.travel.service.CustomerService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/home")
	public String home(){
		return "/home";
	}
	
	@RequestMapping(value = "/login_give", method = RequestMethod.POST)
	public @ResponseBody String login_give(@RequestBody Customer customer){
		customer = customerService.login(customer);
		return "http://localhost:8080/travel/list?openid="+customer.getOpenid();
	}
	
	@RequestMapping(value = "/login_take", method = RequestMethod.POST)
	public @ResponseBody String login_take(@RequestBody Customer customer){
		customer = customerService.login(customer);
		return "http://localhost:8080/travel/lift_list?openid="+customer.getOpenid();
	}

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public @ResponseBody Customer view(String openid){
		Customer c = new Customer();
		c.setOpenid(openid);
		c = customerService.login(c);
		return c;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public @ResponseBody Customer edit(Customer customer){
		System.out.println(customer.getOpenid());
		Customer c = customerService.login(customer);
		c.setNickname(customer.getNickname());
		c.setSex(customer.getSex());
		c.setProvince(customer.getProvince());
		c.setCity(customer.getCity());
		c.setName(customer.getName());
		c.setPhone(customer.getPhone());
		c = customerService.edit(c);
		return c;
	}
	
	@RequestMapping(value = "/get_publishment", method = RequestMethod.POST)
	public @ResponseBody List get_publishment(@RequestBody Customer customer){
		customer = customerService.login(customer);
		return customerService.viewInformation(customer);
	}
	
	@RequestMapping(value = "/get_focus", method = RequestMethod.POST)
	public @ResponseBody List get_focus(@RequestBody Customer customer){
		customer = customerService.login(customer);
		return customerService.viewFocus(customer);
	}
}
