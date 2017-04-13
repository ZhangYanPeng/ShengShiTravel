package com.shengshi.travel.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	@Autowired
	HttpSession session;
	
	@RequestMapping(value = "/publish", method = RequestMethod.GET)
	public String publish(){
		return "publish";
	}
	
	@RequestMapping(value = "/personal", method = RequestMethod.GET)
	public String personal(){
		session.setAttribute("tab", "wo");
		return "personal";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list_information(){
//		PageResults<Information> informations = informationService.list(type, pageNo);
//		request.getSession().setAttribute("informations", informations);
		session.setAttribute("tab", "youshunche");
		return "list";
	}
	@RequestMapping(value = "/lift_list", method = RequestMethod.GET)
	public String lift_list_information(){
//		PageResults<Information> informations = informationService.list(type, pageNo);
//		request.getSession().setAttribute("informations", informations);
		session.setAttribute("tab", "dashunche");
		return "lift-list";
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search_information(HttpServletRequest request, int type, int pageNo, Information information){
		PageResults<Information> informations = informationService.search(information, type, pageNo);
		request.getSession().setAttribute("informations", informations);
		return "";
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view_information(HttpServletRequest request,String category){
//		Information information = informationService.get(id);
//		request.setAttribute("information", information);
		if(category.equals("youshunche")){
			return "view";
		}else{
			return "lift-view";
		}
		
	}
	
	@RequestMapping(value = "/focus", method = RequestMethod.POST)
	public String focus(Customer customer, int type, long information_id){
		Information information = informationService.get(information_id);
		customerService.focus(customer, information, type);
		return "";
	}
}
