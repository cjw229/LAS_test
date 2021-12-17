package com.god.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.god.test.service.LoginService;
import com.god.test.vo.LoginVo;

@Controller
public class LoginController {
	
	@Autowired 
	LoginService loginService;
	
	@GetMapping(value = "/")
	public String main() {
		return "login";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value = "/login")
	public ModelAndView userLogin(HttpSession session,HttpServletRequest request, LoginVo loginvo) {
		System.out.println(loginvo.getEmail());
		System.out.println(loginvo.getPasswd());
		LoginVo loginProcess = loginService.login(loginvo);
		System.out.println("로그인 컨트롤러 진행");
		
		if(loginProcess.getCount() == 1 && loginProcess.getCount() == 0 ) {
			ModelAndView mv= new ModelAndView("login");
			HttpSession loginVo = request.getSession();
			session.setAttribute("customer_email", loginProcess.getEmail());
			
			System.out.println("성공");
			return mv;
		} else {
			ModelAndView mv= new ModelAndView("login?error=fail");
			System.out.println("실패");
			return mv;
		}
		
	}
	
	@RequestMapping(value = "/logout")
	public String userLogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("세션제거 및 로그아웃 완료");
		return "redirect:/login";
	}
}
