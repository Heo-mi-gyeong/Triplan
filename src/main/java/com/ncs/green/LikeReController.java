package com.ncs.green;


import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.LikeReService;
import vo.LikeReVO;

@Controller
public class LikeReController {
	@Autowired 
	LikeReService service;
	
	@RequestMapping(value = "/likeSelect", method = RequestMethod.GET)
	public ModelAndView likeSelect(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		if(service.likeSelect(vo).size()<1) {
			mv.addObject("ok","ok");
		}else {
			mv.addObject("no","no");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/liketoggle", method = RequestMethod.GET)
	public ModelAndView liketoggle(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		if(service.likeSelect(vo).size()<1) {
			service.likeInsert(vo);
			mv.addObject("no","no");
		}else {
			service.likeDelete(vo);
			mv.addObject("ok","ok");
		}
		
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/reviewCheck", method = RequestMethod.GET)
	public ModelAndView reviewCheck(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		response.setContentType("text/html; charset=UTF-8");
		
		if(service.reviewCheck(vo)==null) {
			mv.addObject("rok","ok");
		}else {
			mv.addObject("rno","no");
		}
		mv.addObject("reviewContent",service.reviewCheck(vo));
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.GET)
	public ModelAndView reviewInsert(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		 service.reviewInsert(vo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/reviewDelete", method = RequestMethod.GET)
	public ModelAndView reviewDelete(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		 service.reviewDelete(vo);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.GET)
	public ModelAndView reviewUpdate(HttpServletResponse response,ModelAndView mv,LikeReVO vo){
		 service.reviewUpdate(vo);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
