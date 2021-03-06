package com.shengshi.travel.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shengshi.travel.entity.Customer;
import com.shengshi.travel.entity.Information;
import com.shengshi.travel.service.CustomerService;
import com.shengshi.travel.service.InformationService;
import com.shengshi.travel.support.PageResults;

@Controller
public class InformationController {
	
	@Autowired
	InformationService informationService;
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public String publish(HttpServletRequest request, Information information, Customer customer){
		customerService.publish(customer, information);
		return "";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String list_information(HttpServletRequest request, int type, int pageNo){
		PageResults<Information> informations = informationService.list(type, pageNo);
		request.getSession().setAttribute("informations", informations);
		return "";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search_information(HttpServletRequest request, int type, int pageNo, Information information){
		PageResults<Information> informations = informationService.search(information, type, pageNo);
		request.getSession().setAttribute("informations", informations);
		return "";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String view_information(HttpServletRequest request, long id){
		Information information = informationService.get(id);
		request.setAttribute("information", information);
		return "";
	}
	
	@RequestMapping(value = "/focus", method = RequestMethod.POST)
	public String focus(Customer customer, int type, long information_id){
		Information information = informationService.get(information_id);
		customerService.focus(customer, information, type);
		return "";
	}
}
