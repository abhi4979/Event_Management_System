package com.jsp.eventmanagementsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.dao.UserDao;
import com.jsp.eventmanagementsystem.entity.User;

@Controller
public class UserController {
	@Autowired
    UserDao dao;
	
	@RequestMapping("/adduser")
	public ModelAndView addUser() {
		ModelAndView mav=new ModelAndView();
		User user=new User();
		mav.addObject("userobj", user);
		mav.setViewName("UserForm");
		return mav;
	}
	@RequestMapping("/saveuser")
	public ModelAndView saveUser(@ModelAttribute("userobj")User user) {
		ModelAndView mav=new ModelAndView();
		dao.saveUser(user);
		mav.addObject("message", "Account Created Successfully");
		mav.setViewName("UserLogin");
		return mav;
	}
	@RequestMapping("/userloginvalidate")
	public ModelAndView loginOrganizer(ServletRequest request,HttpSession session) {
		        ModelAndView mav = new ModelAndView();
		        try {
		            String email = request.getParameter("email");
		            String password = request.getParameter("password");
		            
		            User user = dao.login(email, password);
		            
		            if (user != null) {
		                mav.setViewName("UserOptions");
		                session.setAttribute("userinfo", user.getUser_id());
		            } else {
		                mav.addObject("message", "Invalid credentials");
		                mav.setViewName("UserLogin");
		            }
		        } catch (Exception e) {
		            mav.addObject("message", "An error occurred: " + e.getMessage());
		            mav.setViewName("errorPage");
		        }
		        return mav;
		    }
}
