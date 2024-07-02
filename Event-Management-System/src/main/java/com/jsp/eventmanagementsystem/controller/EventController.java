package com.jsp.eventmanagementsystem.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.jsp.eventmanagementsystem.dao.EventDao;
import com.jsp.eventmanagementsystem.dao.OrganizerDao;
import com.jsp.eventmanagementsystem.entity.Event;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;
import com.jsp.eventmanagementsystem.entity.User;

@Controller
public class EventController {
    @Autowired
    EventDao dao;
    @Autowired
    OrganizerDao orgdao;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(LocalDate.class, new java.beans.PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            }

            @Override
            public String getAsText() {
                LocalDate value = (LocalDate) getValue();
                return value != null ? value.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) : "";
            }
        });

        binder.registerCustomEditor(LocalTime.class, new java.beans.PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:mm")));
            }

            @Override
            public String getAsText() {
                LocalTime value = (LocalTime) getValue();
                return value != null ? value.format(DateTimeFormatter.ofPattern("HH:mm")) : "";
            }
        });
    }

    @RequestMapping("/addevent")
    public ModelAndView addEvent() {
        ModelAndView mav = new ModelAndView();
        Event event = new Event();
        mav.addObject("eventobj", event);
        mav.setViewName("EventForm");
        return mav;
    }
    @Transactional
    @RequestMapping("/saveevent")
    public ModelAndView saveEvent(@ModelAttribute("eventobj") Event event, HttpSession session) {
        
            Integer organizer_id = (Integer) session.getAttribute("organizerinfo");
            Event_Organizer organizer = orgdao.findById(organizer_id);

            // Initialize the events list if it is null
            if (organizer.getEvents() == null) {
                organizer.setEvents(new ArrayList<>());
            }

            organizer.getEvents().add(event);
            event.setOrganizer(organizer);
            dao.saveEvent(event);
            orgdao.updateOrganizer(organizer);

            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "Event added successfully");
            mav.setViewName("OrganizerOptions");
            return mav;
       
        }
    @RequestMapping("/viewevent")
    public ModelAndView viewAllEvent(HttpSession session) {
    	 Integer organizer_id = (Integer) session.getAttribute("organizerinfo");
         Event_Organizer org = orgdao.findById(organizer_id);
         if (organizer_id == null) {
             return new ModelAndView("redirect://OrganizerLogin.jsp");
         }
         
         List<Event> events =org.getEvents();
         ModelAndView mav = new ModelAndView();
         mav.addObject("events", events);
         mav.setViewName("ViewAllEvent");
         return mav;
    }
    @RequestMapping("/updateevent")
    public ModelAndView updateEvent(@RequestParam("id")int id,HttpSession session) {
    	Event event=dao.findById(id);
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("eventexistinginfo", event);
    	mav.setViewName("UpdateEvent");
    	return mav;
    }
   
    @RequestMapping("/updateeventinfo")
    public ModelAndView updateEventInfo(@ModelAttribute("eventexistinginfo") Event updatedEvent) {
      

        // Load the existing event from the database
        Event existingEvent = dao.findById(updatedEvent.getEvent_id());
        if (existingEvent == null) {
            return new ModelAndView("errorPage").addObject("message", "Event not found");
        }

        existingEvent.setName(updatedEvent.getName());
        existingEvent.setDescription(updatedEvent.getDescription());
        existingEvent.setDate(updatedEvent.getDate());
        existingEvent.setTime(updatedEvent.getTime());
        existingEvent.setLocation(updatedEvent.getLocation());
        existingEvent.setAvl_ticket(updatedEvent.getAvl_ticket());
        existingEvent.setTicket_price(updatedEvent.getTicket_price());
        existingEvent.setType(updatedEvent.getType());
      
        dao.updateEvent(existingEvent);

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "Event Updated Successfully");
        mav.setViewName("redirect:/viewevent");  // Corrected URL syntax
        return mav;
    }
    
    @RequestMapping("/delete")
    public ModelAndView deleteEvent(@RequestParam("id") int id, HttpSession session) {
        
        	 Integer organizer_id = (Integer) session.getAttribute("organizerinfo");
             Event_Organizer org = orgdao.findById(organizer_id);
            List<Event> events = org.getEvents();
            List<Event> eventList = events.stream().filter(event -> event.getEvent_id() != id).collect(Collectors.toList());
            org.setEvents(eventList);
            
            orgdao.updateOrganizer(org);
            dao.deleteById(id);
            
            ModelAndView mav = new ModelAndView();
            mav.addObject("message", "product deleted Successfully");
            mav.setViewName("redirect://viewevent");
            return mav;
        
    }

   

    @RequestMapping("/browseevent")
    public ModelAndView browseEvent() {
    	   List<Event> eventnameinfo=dao.viewAllEvent();
    	   ModelAndView mav=new ModelAndView();
    	   mav.addObject("alleventlist", eventnameinfo); // Assuming events is your List<Event>

    	   mav.setViewName("SearchEvent");
    	   return mav;
    }
    @RequestMapping("/vieweventlist")
    public ModelAndView viewEvent(ServletRequest request) {
        String location = request.getParameter("location");
        String dateStr = request.getParameter("date");
        String type = request.getParameter("type");

        LocalDate date = null;
        if (dateStr != null && !dateStr.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            date = LocalDate.parse(dateStr, formatter);
        }

        List<Event> eventlist = dao.viewSearchEvent(location, date, type);

        ModelAndView mav = new ModelAndView();
        mav.addObject("eventlist", eventlist); // Add events to the model
        mav.setViewName("ViewEventList"); // Set view name

        return mav;
    }
    
    
    @RequestMapping("/filtereventinfo")
    public ModelAndView viewFilterEvents(ServletRequest request) {
    	  ModelAndView mav = new ModelAndView();
          try {
              String minCostStr = request.getParameter("mincost");
              String maxCostStr = request.getParameter("maxcost");

              Double minPrice = minCostStr != null && !minCostStr.isEmpty() ? Double.parseDouble(minCostStr.trim()) : null;
              Double maxPrice = maxCostStr != null && !maxCostStr.isEmpty() ? Double.parseDouble(maxCostStr.trim()) : null;

              if (minPrice == null || maxPrice == null) {
                  mav.addObject("message", "Please provide both minimum and maximum cost.");
                  mav.setViewName("errorPage");
                  return mav;
              }

              List<Event> events = dao.viewFilterEvent(minPrice, maxPrice);
              if (events != null && !events.isEmpty()) {
                  mav.addObject("filterlist", events);
                  mav.setViewName("FilterByPrice");
              } else {
                  mav.addObject("message", "No Event Found");
                  mav.setViewName("errorPage");
              }
          } catch (NumberFormatException e) {
              mav.addObject("message", "Invalid price format. Please enter valid numbers.");
              mav.setViewName("errorPage");
          }
          return mav;
      }
    @RequestMapping("/organizerlogout")
    public ModelAndView organizerLogout(HttpSession session) {
    	session.invalidate();
    	ModelAndView mav=new ModelAndView();
    	mav.addObject("message", "Logout Successfully");
    	mav.setViewName("OrganizerHome");
    	return mav;
    }
    
    @RequestMapping("/vieweventbyadmin")
	public ModelAndView ViewAllEvent() {
		 List<Event> event=dao.viewAllEvent();
		 ModelAndView mav=new ModelAndView();
		 mav.addObject("eventbyadmin", event);
		 mav.setViewName("ViewAllEventList");
		 return mav;
	}
	@RequestMapping("/updateeventbyadmin")
	public ModelAndView updateUser(@RequestParam("id")int id) {
		ModelAndView mav=new ModelAndView();
		Event event=dao.findById(id);
		if(event == null) {
			mav.addObject("message", "User not found");
			mav.setViewName("errorPage");
		}
		mav.addObject("eventexistinginformation", event);
		mav.setViewName("UpdateEventByAdmin");
		return mav;
	}
	
	@RequestMapping("/updateeventinformation")
	public ModelAndView updateUserInfo(@ModelAttribute("eventexistinginformation")Event e) {
		Event existingEvent = dao.findById(e.getEvent_id());
        if (existingEvent == null) {
            return new ModelAndView("errorPage").addObject("message", "Event not found");
        }

        existingEvent.setName(e.getName());
        existingEvent.setDescription(e.getDescription());
        existingEvent.setDate(e.getDate());
        existingEvent.setTime(e.getTime());
        existingEvent.setLocation(e.getLocation());
        existingEvent.setAvl_ticket(e.getAvl_ticket());
        existingEvent.setTicket_price(e.getTicket_price());
        existingEvent.setType(e.getType());
      
        dao.updateEvent(existingEvent);

        ModelAndView mav = new ModelAndView();
        mav.addObject("message", "Event Updated Successfully");
        mav.setViewName("redirect:/vieweventbyadmin");  // Corrected URL syntax
        return mav;
	}
	 @RequestMapping("/deleteevent")
	    public ModelAndView deleteProduct(@RequestParam("id") int id, HttpSession session) {
	            dao.deleteById(id);
	            
	            ModelAndView mav = new ModelAndView();
	            mav.addObject("message", "Event deleted Successfully");
	            mav.setViewName("redirect://vieweventbyadmin");
	            return mav;
	        
	    }
	   
    	}
    