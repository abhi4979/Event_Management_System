package com.jsp.eventmanagementsystem.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;
import com.jsp.eventmanagementsystem.entity.User;

@Controller
public class OrganizerController {
    @Autowired
    OrganizerDao dao;

    @RequestMapping("/addorganizer")
    public ModelAndView addOrganizer() {
        ModelAndView mav = new ModelAndView();
        try {
            Event_Organizer org = new Event_Organizer();
            mav.addObject("organizerobj", org);
            mav.setViewName("OrganizerForm");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/saveorganizer")
    public ModelAndView saveOrganizer(@ModelAttribute("organizerobj") Event_Organizer org) {
        ModelAndView mav = new ModelAndView();
        try {
            org.setStatus("Not Approved");
            dao.saveOrganizer(org);
            mav.addObject("message", "You account has been created and wait for some time to get the approval from Admin. After that getting approval you can login your Account.");
            mav.setViewName("OrganizerLogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/organizerloginvalidate")
    public ModelAndView loginOrganizer(ServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Event_Organizer org = dao.login(email, password);

            if (org != null) {
                if (org.getStatus().equals("Not Approved")) {
                    mav.addObject("message", "Your account is in review, please wait for some time.");
                    mav.setViewName("displaymessage");
                } else {
                    session.setAttribute("organizerinfo", org.getOrg_id());
                    mav.addObject("message", "Logged in successfully");
                    mav.setViewName("OrganizerOptions");
                }
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

    @RequestMapping("/fetchunapprovedorganizers")
    public ModelAndView fetchUnapprovedOrganizers() {
        ModelAndView mav = new ModelAndView();
        try {
            List<Event_Organizer> organizer = dao.fetchUnapprovedOrganizers();
            mav.addObject("unapprovedorganizers", organizer);
            mav.setViewName("DisplayUnapprovedOrganizers");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/approveorganizer")
    public ModelAndView approveOrganizer(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView();
        try {
            Event_Organizer org = dao.findById(id);
            if (org != null) {
                org.setStatus("Approved");
                dao.updateOrganizer(org);
                mav.addObject("message", "Approved");
            } else {
                mav.addObject("message", "Organizer not found");
            }
            mav.setViewName("redirect://fetchunapprovedorganizers");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/viewallorganizers")
    public ModelAndView viewAllOrganizers() {
        ModelAndView mav = new ModelAndView();
        try {
            List<Event_Organizer> org = dao.viewAllEventOrganizers();
            mav.addObject("orgbyadmin", org);
            mav.setViewName("ViewOrganizerList");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/updateorganizer")
    public ModelAndView updateOrganizer(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView();
        try {
            Event_Organizer org = dao.findById(id);
            if (org == null) {
                mav.addObject("message", "User not found");
                mav.setViewName("errorPage");
            } else {
                mav.addObject("orgexistinginfo", org);
                mav.setViewName("UpdateOrganizer");
            }
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/updateorginfo")
    public ModelAndView updateOrgInfo(@ModelAttribute("orgexistinginfo") Event_Organizer e) {
        ModelAndView mav = new ModelAndView();
        try {
            Event_Organizer evg = dao.findById(e.getOrg_id());
            evg.setName(e.getName());
            evg.setEmail(e.getEmail());
            evg.setMobilenumber(e.getMobilenumber());
            evg.setCompany_name(e.getCompany_name());
            evg.setStatus(e.getStatus());
            dao.updateOrganizer(evg);
            mav.addObject("message", "User Updated Successfully");
            mav.setViewName("redirect://viewallorganizers");
        } catch (Exception ex) {
            mav.addObject("message", "An error occurred: " + ex.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/deleteorganizer")
    public ModelAndView deleteOrganizer(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView();
        try {
            dao.deleteById(id);
            mav.addObject("message", "Deleted Successfully");
            mav.setViewName("redirect://viewallorganizers");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/forgotpasswordbyorg")
    public ModelAndView forgotPassword(ServletRequest request, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            String email = request.getParameter("email");
            Long mob = Long.parseLong(request.getParameter("mobilenumber")); 
            Event_Organizer user = dao.forgotPassword(email, mob);
            if (user != null) {
                mav.setViewName("PassObjByOrg");
                session.setAttribute("orgid", user.getOrg_id());
            } else {
                mav.addObject("message", "Invalid Credential");
                mav.setViewName("ForgotByOrg");
            }
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/newpbyorg")
    public ModelAndView newP() {
        ModelAndView mav = new ModelAndView();
        try {
            User a = new User();
            mav.addObject("passwordobj", a);
            mav.setViewName("PasswordCreateByOrg");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/savepasswordbyorg")
    public ModelAndView savePassword(@ModelAttribute("passwordobj") Event_Organizer a, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            Integer orgid = (Integer) session.getAttribute("orgid");
            Event_Organizer org = dao.findById(orgid);
            org.setPassword(a.getPassword());
            dao.updateOrganizer(org);
            session.removeAttribute("orgid");
            mav.addObject("message", "Password Created Successfully");
            mav.setViewName("OrganizerLogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/organizerlogout")
    public ModelAndView logout(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            session.invalidate();
            mav.addObject("message", "Logged out successfully");
            mav.setViewName("OrganizerLogin");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
}
