package com.jsp.eventmanagementsystem.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.EventDao;
import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.dao.PaymentDao;
import com.jsp.eventmanagementsystem.dao.UserDao;
import com.jsp.eventmanagementsystem.entity.Event;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;
import com.jsp.eventmanagementsystem.entity.Payment;
import com.jsp.eventmanagementsystem.entity.User;

@Controller
public class PaymentController {

    @Autowired
    PaymentDao paymentdao;

    @Autowired
    EventDao eventdao;
    
    @Autowired
    OrganizerDao orgdao;
    
    @Autowired
    UserDao userdao;

    @RequestMapping("/bookevent")
    public ModelAndView bookEvent(@RequestParam(value = "id", required = true) String idStr, HttpSession session) {
        Integer id = null;
        id = Integer.parseInt(idStr);
        System.out.println("Received id: " + id);
        Integer user_id = (Integer) session.getAttribute("userinfo");
        User user = userdao.findById(user_id);
        if (user == null) {
            System.out.println("User not found in session.");
            return new ModelAndView("redirect:/login"); // Handle error appropriately
        }
        Event event = eventdao.findById(id);
        if (event == null) {
            System.out.println("Event not found for id: " + id);
            return new ModelAndView("errorPage"); // Handle error appropriately
        }
        Payment payment = new Payment();
        payment.setUsername(user.getName());
        payment.setEventname(event.getName());
        payment.setAmount(event.getTicket_price());
        payment.setQuantity(1);
        payment.setStatus("UnSuccessful");
        session.setAttribute("eventinfo", event.getEvent_id());
        session.setAttribute("paymentinfo", payment);
        ModelAndView mav = new ModelAndView();
        mav.addObject("paymentobj", payment);
        mav.setViewName("QuantityForm");
        return mav;
    }

    @RequestMapping("/savepayment")
    public ModelAndView savePayment(@ModelAttribute("paymentobj") Payment payment, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        Payment sessionPayment = (Payment) session.getAttribute("paymentinfo");
        Integer user=(Integer)session.getAttribute("userinfo");
        Integer event=(Integer)session.getAttribute("eventinfo");
         User user_id=userdao.findById(user);
         Event event_id=eventdao.findById(event);

        if (sessionPayment == null) {
            System.out.println("Payment info not found in session.");
            return new ModelAndView("errorPage");
        }

        if(event_id.getAvl_ticket()==0) {
             return new ModelAndView("errorPage").addObject("message", "Ticket is not Available");
        }
        else if(event_id.getAvl_ticket() >= payment.getQuantity()) {
        sessionPayment.setQuantity(payment.getQuantity());
        sessionPayment.setAmount(sessionPayment.getAmount() * payment.getQuantity());

        // Save payment to database
        sessionPayment.setUser(user_id);
        sessionPayment.setEvent(event_id);
        paymentdao.savePayment(sessionPayment); 
        mav.addObject("paymentobj", sessionPayment );
        mav.setViewName("PaymentConfirmation");
        return mav;
        }
        else {
             return new ModelAndView("errorPage").addObject("message", "No. Of Ticket you try to book is not available,please select less no. of amount");
        }
    }

    @RequestMapping("/confirmpayment")
    public ModelAndView confirmPayment(HttpSession session) {
        Payment sessionPayment = (Payment) session.getAttribute("paymentinfo");
        Integer eventid=(Integer)session.getAttribute("eventinfo");
        Event event=eventdao.findById(eventid);

        if (sessionPayment != null) {
            sessionPayment.setStatus("Successful");
            paymentdao.updateEvent(sessionPayment);  // Assuming update is the correct method

            Event events = sessionPayment.getEvent();
            if (events != null) {
                event.getPayments().add(sessionPayment); // Add payment to event's payment list
            }
        }
        int avl_ticket=event.getAvl_ticket()-sessionPayment.getQuantity();
        event.setAvl_ticket(avl_ticket);
        eventdao.updateEvent(event);
        session.removeAttribute("eventinfo");
        session.removeAttribute("paymentinfo");

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "Payment Successful");
        mav.setViewName("ConfirmPayment");
        return mav;
    }

    @RequestMapping("/viewalluser")
    public ModelAndView viewAllUser(HttpSession session) {
        Integer organizer_id = (Integer) session.getAttribute("organizerinfo");
        if (organizer_id == null) {
            return new ModelAndView("redirect:/OrganizerLogin.jsp");
        }
        
        Event_Organizer org = orgdao.findById(organizer_id);
        List<Payment> payments = org.getEvents().stream()
            .flatMap(event -> event.getPayments().stream())
            .collect(Collectors.toList());
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("paymentinformation", payments);
        mav.setViewName("ShowBookedUserList");
        return mav;
    }
    
    @RequestMapping("/paymentlist")
    public ModelAndView paymentList() {
        List<Payment> p = paymentdao.viewAllPayament();
        ModelAndView mav = new ModelAndView();
        mav.addObject("payobj", p);
        mav.setViewName("ViewPaymentByAdmin");
        return mav;
    }

    @RequestMapping("/updatep")
    public ModelAndView updatePayment(@RequestParam("id") int id) {
        Payment p = paymentdao.findById(id);
        ModelAndView mav = new ModelAndView();
        mav.addObject("paymentobject", p);
        mav.setViewName("UpdatePaymentList");
        return mav;
    }

    @RequestMapping("/updatepaymentinfo")
    public ModelAndView updatePaymentInfo(@ModelAttribute("paymentobject") Payment p) {
        ModelAndView mav = new ModelAndView();
        try {
            Payment payment = paymentdao.findById(p.getPayment_id());
            payment.setUsername(p.getUsername());
            payment.setEventname(p.getEventname());
            payment.setQuantity(p.getQuantity());
            payment.setAmount(p.getAmount());
            payment.setStatus(p.getStatus());
            paymentdao.updateEvent(payment);
            mav.addObject("message", "Updated Successfully");
            mav.setViewName("redirect:/paymentlist");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }

    @RequestMapping("/deletep")
    public ModelAndView deletePayment(@RequestParam("id") int id) {
        ModelAndView mav = new ModelAndView();
        try {
            paymentdao.deleteById(id);
            mav.addObject("message", "Deleted Successfully");
            mav.setViewName("redirect:/paymentlist");
        } catch (Exception e) {
            mav.addObject("message", "An error occurred: " + e.getMessage());
            mav.setViewName("errorPage");
        }
        return mav;
    }
}
