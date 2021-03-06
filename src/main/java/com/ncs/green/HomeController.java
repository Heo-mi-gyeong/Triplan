package com.ncs.green;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.LikeReService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired 
	LikeReService lservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		HttpSession session = request.getSession();
		session.removeAttribute("areaCode");
		session.removeAttribute("sigunguCode");
		session.removeAttribute("areaName");
		session.removeAttribute("sigunguName");
		model.addAttribute("hot",lservice.hotMax());
		
		return "home";
	}
	
}
