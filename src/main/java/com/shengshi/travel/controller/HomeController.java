package com.shengshi.travel.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	/**
	 * 有顺车
	 * @param openid
	 * @return
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(String openid){
		return "list";
	}
	
	/**
	 * 搭顺车
	 * @param openid
	 * @return
	 */
	@RequestMapping(value = "/lift_list", method = RequestMethod.GET)
	public String lift_list(String openid){
		return "lift-list";
	}
	/**
	 * 发布
	 * @param openid
	 * @return
	 */
	@RequestMapping(value = "/publish", method = RequestMethod.GET)
	public String publish(String openid){
		return "publish";
	}
	
	/**
	 *个人信息 
	 * @param openid
	 * @return
	 */
	@RequestMapping(value = "/personal", method = RequestMethod.GET)
	public String personal(String openid){
		return "personal";
	}
	
	
}
