package com.jsp.eventmanagementsystem.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;

@Controller
public class OrganizerController {
	@Autowired
    OrganizerDao dao;
	
	@RequestMapping("/addorganizer")
	public ModelAndView addOrganizer() {
		ModelAndView mav=new ModelAndView();
		Event_Organizer org=new Event_Organizer();
		mav.addObject("organizerobj", org);
		mav.setViewName("OrganizerForm");
		return mav;
	}
	@RequestMapping("/saveorganizer")
	public ModelAndView saveOrganizer(@ModelAttribute("organizerobj")Event_Organizer org) {
		ModelAndView mav=new ModelAndView();
		dao.saveOrganizer(org);
		mav.addObject("message", "Account Created Successfully");
		mav.setViewName("OrganizerLogin");
		return mav;
	}
	@RequestMapping("/organizerloginvalidate")
	public ModelAndView loginOrganizer(ServletRequest request,HttpSession session) {
		        ModelAndView mav = new ModelAndView();
		        try {
		            String email = request.getParameter("email");
		            String password = request.getParameter("password");
		            
		            Event_Organizer org = dao.login(email, password);
		            
		            if (org != null) {
		                mav.setViewName("OrganizerOptions");
		                session.setAttribute("organizerinfo", org.getOrg_id());
		            } else {
		                mav.addObject("message", "Invalid credentials");
		                mav.setViewName("OrganizerLogin");
		            }
		        } catch (Exception e) {
		            mav.addObject("message", "An error occurred: " + e.getMessage());
		            mav.setViewName("errorPage");
		        }
		        return mav;
		    }

	}

