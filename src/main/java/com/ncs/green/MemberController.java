package com.ncs.green;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.LikeReService;
import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired 
	MemberService service;
	@Autowired 
	LikeReService lservice;
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView about(ModelAndView mv) {
		mv.setViewName("member/aboutForm");
		return mv;
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest request, ModelAndView mv,MemberVO vo){
			service.update(vo);
			request.getSession().invalidate();
			mv.setViewName("redirect:LoginForm");
			return mv;
	}
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(HttpServletRequest request, ModelAndView mv,MemberVO vo){
			mv.addObject("mInfo", service.selectOne(vo));
			mv.setViewName("member/MyPageForm");
		return mv;
	}
	
	@RequestMapping(value = "/loginf", method = RequestMethod.GET)
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/LoginForm");
		return mv;
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response,ModelAndView mv,MemberVO vo) {
		String password= vo.getPassword();
		response.setContentType("text/html; charset=UTF-8");
		
		vo = service.selectOne(vo);
		if(vo != null) {
	         
			if ( vo.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("LoginId", vo.getId());
				session.setAttribute("LoginNick", vo.getNick()); 
				mv.addObject("message",null);
				mv.setViewName("redirect:home");
			} else {
				mv.addObject("message","0");
				mv.setViewName("member/LoginForm");
			}
		} else {
			mv.addObject("message","0");
			mv.setViewName("member/LoginForm");
		}
		return mv;
	}
	
	@RequestMapping(value = "/joinf", method = RequestMethod.GET)
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/JoinForm");
		return mv;
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public ModelAndView join(HttpServletRequest request, ModelAndView mv,MemberVO vo){
		if(service.insert(vo)>0) {
			mv.setViewName("member/LoginForm");
		}else {
			mv.setViewName("member/JoinForm");
		}
		return mv;
	}
	
	@RequestMapping(value = "/joinCh", method = RequestMethod.POST)
	public ModelAndView joinCh(HttpServletResponse response, ModelAndView mv,MemberVO vo){
		response.setContentType("text/html; charset=UTF-8");
		vo = service.selectOne(vo);
		if(vo==null) {
			mv.addObject("message","ok");
		}else {
			mv.addObject("message","no");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/joinCh2", method = RequestMethod.POST)
	public ModelAndView joinCh2(HttpServletResponse response, ModelAndView mv,MemberVO vo){
		response.setContentType("text/html; charset=UTF-8");
		vo = service.selectni(vo);
		if(vo==null) {
			mv.addObject("message","ok");
		}else {
			mv.addObject("message","no");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request,ModelAndView mv,MemberVO vo,RedirectAttributes rttr) {
		request.getSession().invalidate();
		mv.setViewName("redirect:home");
		return mv;
	}
	
	@RequestMapping(value = "/home")
	public ModelAndView home(HttpServletRequest request,ModelAndView mv,MemberVO vo,RedirectAttributes rttr) {
		HttpSession session = request.getSession();
		session.removeAttribute("areaCode");
		session.removeAttribute("sigunguCode");
		session.removeAttribute("areaName");
		session.removeAttribute("sigunguName");
		
		mv.addObject("hot",lservice.hotMax());
		mv.setViewName("home");
		return mv;
	}
}