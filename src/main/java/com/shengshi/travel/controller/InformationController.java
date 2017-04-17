package com.shengshi.travel.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
import com.shengshi.travel.service.InformationService;
import com.shengshi.travel.support.PageResults;

@Controller
@RequestMapping("information")
public class InformationController {
	
	@Autowired
	InformationService informationService;
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/publish", method = RequestMethod.POST)
	public @ResponseBody int publish(@RequestBody Map map){
		System.out.println(map);
		Information information = new Information();
		if( Integer.valueOf((String) map.get("type")) == 0 ){
			information.setCapacity(Integer.valueOf((String) map.get("capacity")));
			information.setCar_type(Integer.valueOf((String)map.get("chexing")));
		}
		information.setType(Integer.valueOf((String) map.get("type")));
		information.setPublish_time(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		try {
			String timestr = (String) map.get("start_time");
			timestr = timestr.replace('T', ' ');
			Date start_time = sdf.parse(timestr);
			information.setStart_time(start_time.getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
		information.setStartpos((String) map.get("startpos"));
		information.setDestination((String) map.get("destination"));
		//TODO
		//information.setDistance(Double.valueOf((String) map.get("distance")));
		//information.setTime(Double.valueOf((String) map.get("time")));
		information.setRoad_toll(Double.valueOf((String) map.get("road_toll")));
		information.setRemarks((String) map.get("remarks"));
		information.setContact((String) map.get("contact"));
		information.setContact_info((String) map.get("contact_info"));
		Customer customer = new Customer();
		customer.setOpenid((String) map.get("openid"));
		customer = customerService.login(customer);
		return customerService.publish(customer, information);
	}
	
	
	@RequestMapping(value = "/get_list", method = RequestMethod.POST)
	public @ResponseBody PageResults<Information> list_information(@RequestBody Map map){
		System.out.println(map);
		int type = Integer.valueOf((String)map.get("type"));
		int order = Integer.valueOf((Integer)map.get("order"));
		int pageNo = Integer.valueOf((Integer) map.get("pageNo"));
		return informationService.list(type, order, pageNo);
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public @ResponseBody PageResults<Information> search_information(@RequestBody Map map){
		int type = Integer.valueOf((String)map.get("type"));
		Information information = new Information();
		information.setStartpos((String)map.get("start_pos"));
		information.setDestination((String)map.get("destination"));
		int order = Integer.valueOf((Integer)map.get("order"));
		int pageNo = Integer.valueOf((Integer) map.get("pageNo"));
		return informationService.search(information, type, pageNo);
	}
	
	@RequestMapping(value = "/get_information", method = RequestMethod.POST)
	public @ResponseBody Information get_information(@RequestBody String information_id){
		return informationService.get(Long.valueOf(information_id));
	}
	
	@RequestMapping(value = "/focus", method = RequestMethod.POST)
	public @ResponseBody int focus(Customer customer, int type, long information_id){
		Information information = informationService.get(information_id);
		return customerService.focus(customer, information, type);
	}
}
