package com.jsp.eventmanagementsystem.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int event_id;
    private String name;
    private String description;
    private LocalDate date;
    private LocalTime time;
    private String location;
    private int avl_ticket;
    private Double ticket_price;
    private String type;
    
    private String imageUrl;

    // Getters and Setters
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }


    @ManyToMany(mappedBy = "eventlist")
    @Cascade(CascadeType.ALL)
    private List<User> users;

    @OneToMany(mappedBy = "event")
    @Cascade(CascadeType.ALL)
    private List<Payment> payments = new ArrayList<>();
    
    @ManyToOne
    @JoinColumn(name = "organizer_id", nullable = false)
    private Event_Organizer organizer;

    public Event_Organizer getOrganizer() {
		return organizer;
	}

	public void setOrganizer(Event_Organizer organizer) {
		this.organizer = organizer;
	}

	// Getters and Setters
    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getAvl_ticket() {
        return avl_ticket;
    }

    public void setAvl_ticket(int avl_ticket) {
        this.avl_ticket = avl_ticket;
    }

    public Double getTicket_price() {
        return ticket_price;
    }

    public void setTicket_price(Double ticket_price) {
        this.ticket_price = ticket_price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

   

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }
}
