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
            mav.setViewName("adminlogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/forgotpassword")
    public ModelAndView forgotPassword(ServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            String email = request.getParameter("email");
            Long mob = Long.parseLong(request.getParameter("mobilenumber"));
            Admin admin = dao.forgotPassword(email, mob);

            if (admin != null) {
                mav.setViewName("PassObj");
                session.setAttribute("adminid", admin.getId());
            } else {
                mav.addObject("message", "Invalid Credential");
                mav.setViewName("ForgotPassword");
            }
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/newp")
    public ModelAndView newP() {
        ModelAndView mav = new ModelAndView();
        try {
            Admin a = new Admin();
            mav.addObject("passwordobj", a);
            mav.setViewName("PasswordCreate");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/savepassword")
    public ModelAndView savePassword(@ModelAttribute("passwordobj") Admin a, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            Integer adminid = (Integer) session.getAttribute("adminid");
            Admin admin = dao.findById(adminid);
            admin.setPassword(a.getPassword());
            dao.updateAdmin(admin);
            mav.addObject("message", "Password Created Successfully");
            mav.setViewName("adminlogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
}
