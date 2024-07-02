package com.jsp.eventmanagementsystem.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.dao.UserDao;
import com.jsp.eventmanagementsystem.entity.Event;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;
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
	@RequestMapping("/adduserbyadmin")
	public ModelAndView addUserByAdmin() {
		ModelAndView mav=new ModelAndView();
		User user=new User();
		mav.addObject("userobject", user);
		mav.setViewName("AddUserForm");
		return mav;
	}
	@RequestMapping("/saveuserbyadmin")
	public ModelAndView saveUserByAdmin(@ModelAttribute("userobject")User user) {
		ModelAndView mav=new ModelAndView();
		dao.saveUser(user);
		mav.addObject("message", "Account Created Successfully");
		mav.setViewName("adminoptions");
		return mav;
	}
	@RequestMapping("/viewallusers")
	public ModelAndView ViewAllUsers() {
		 List<User> user=dao.viewAllUsers();
		 ModelAndView mav=new ModelAndView();
		 mav.addObject("users", user);
		 mav.setViewName("ViewAllUserList");
		 return mav;
	}
	@RequestMapping("/updateuser")
	public ModelAndView updateUser(@RequestParam("id")int id) {
		ModelAndView mav=new ModelAndView();
		User user=dao.findById(id);
		if(user == null) {
			mav.addObject("message", "User not found");
			mav.setViewName("errorPage");
		}
		mav.addObject("userexistinginfo", user);
		mav.setViewName("UpdateUser");
		return mav;
	}
	
	@RequestMapping("/updateuserinfo")
	public ModelAndView updateUserInfo(@ModelAttribute("userexistinginfo")User u) {
		User user=dao.findById(u.getUser_id());
		user.setName(u.getName());
		user.setEmail(u.getEmail());
		user.setMobilenumber(u.getMobilenumber());
		dao.updateUser(user);
		ModelAndView mav=new ModelAndView();
		mav.addObject("message", "User Updated Successfully");
		mav.setViewName("redirect://viewallusers");
		return mav;
	}
	 @RequestMapping("/deleteuser")
	    public ModelAndView deleteProduct(@RequestParam("id") int id) {
	            dao.deleteById(id);
	            
	            ModelAndView mav = new ModelAndView();
	            mav.addObject("message", "User deleted Successfully");
	            mav.setViewName("redirect://viewallusers");
	            return mav;
	        
	    }
	
}
