package com.jsp.eventmanagementsystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.eventmanagementsystem.dao.EventDao;
import com.jsp.eventmanagementsystem.dao.PaymentDao;
import com.jsp.eventmanagementsystem.entity.Event;
import com.jsp.eventmanagementsystem.entity.Payment;
import com.jsp.eventmanagementsystem.entity.User;

@Controller
public class PaymentController {

    @Autowired
    PaymentDao paymentdao;

    @Autowired
    EventDao eventdao;

    @RequestMapping("/bookevent")
    public ModelAndView bookEvent(@RequestParam(value = "id", required = true) String idStr, HttpSession session) {
        Integer id = null;
        id = Integer.parseInt(idStr);
        System.out.println("Received id: " + id);
        User user = (User) session.getAttribute("userinfo");
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

        session.setAttribute("paymentinfo", payment);
        ModelAndView mav = new ModelAndView();
        mav.addObject("paymentobj", payment);
        mav.setViewName("QuantityForm");
        return mav;
    }

    @RequestMapping("/savepayment")
    public ModelAndView savePayment(@ModelAttribute("paymentobj") Payment payment, HttpSession session) {
        Payment sessionPayment = (Payment) session.getAttribute("paymentinfo");

        if (sessionPayment == null) {
            System.out.println("Payment info not found in session.");
            return new ModelAndView("errorPage"); // Handle error appropriately
        }

        // Update session payment details with the user input
        sessionPayment.setQuantity(payment.getQuantity());
        sessionPayment.setAmount(sessionPayment.getAmount() * payment.getQuantity());

        // Save payment to database
        paymentdao.savePayment(sessionPayment);


        ModelAndView mav = new ModelAndView();
        mav.addObject("paymentobj", sessionPayment );
        mav.setViewName("PaymentConfirmation");
        return mav;
    }
    @RequestMapping("/confirmpayment")
    public ModelAndView confirmPayment(HttpSession session) {

         session.removeAttribute("paymentinfo");
        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "Payment Successful");
        mav.setViewName("ConfirmPayment");
        return mav;
    }
}
