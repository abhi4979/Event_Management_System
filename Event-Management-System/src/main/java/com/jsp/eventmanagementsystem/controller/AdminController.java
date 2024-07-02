package com.jsp.eventmanagementsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.AdminDao;
import com.jsp.eventmanagementsystem.entity.Admin;

@Controller
public class AdminController {
	 @Autowired
	    AdminDao dao;
	    
	    @RequestMapping("/addadmin")
	    public ModelAndView addAdmin() {
	        ModelAndView mav = new ModelAndView();
	        try {
	            Admin admin = new Admin();
	            mav.addObject("adminobj", admin);
	            mav.setViewName("adminform");
	        } catch (Exception e) {
	            mav.addObject("message", "An error occurred: " + e.getMessage());
	            mav.setViewName("errorPage");
	        }
	        return mav;
	    }
	    
	    @RequestMapping("saveadmin")
	    public ModelAndView saveAdmin(@ModelAttribute("adminobj") Admin admin) {
	        ModelAndView mav = new ModelAndView();
	        try {
	            dao.saveAdmin(admin);
	            mav.addObject("message", "Account created successfully");
	            mav.setViewName("adminlogin");
	        } catch (Exception e) {
	            mav.addObject("message", "An error occurred: " + e.getMessage());
	            mav.setViewName("errorPage");
	        }
	        return mav;
	    }
	    
	    @RequestMapping("/adminloginvalidate")
	    public ModelAndView loginValidate(ServletRequest request, HttpSession session) {
	        ModelAndView mav = new ModelAndView();
	        try {
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");
	            
	            Admin admin = dao.login(email, password);
	            
	            if (admin != null) {
	                mav.setViewName("adminoptions");
	                session.setAttribute("admininfo", admin);
	            } else {
	                mav.addObject("message", "Invalid credentials");
	                mav.setViewName("adminlogin");
	            }
	        } catch (Exception e) {
	            mav.addObject("message", "An error occurred: " + e.getMessage());
	            mav.setViewName("errorPage");
	        }
	        return mav;
	    }
	    
	    @RequestMapping("/adminlogout")
	    public ModelAndView logout(HttpSession session) {
	        ModelAndView mav = new ModelAndView();
	        try {
	            session.invalidate();
	            mav.addObject("message", "Logged out successfully");
	            mav.setViewName("adminhome");
	        } catch (Exception e) {
	            mav.addObject("message", "An error occurred: " + e.getMessage());
	            mav.setViewName("errorPage");
	        }
	        return mav;
	    }
	
}
