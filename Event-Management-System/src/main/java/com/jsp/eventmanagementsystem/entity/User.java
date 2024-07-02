package com.jsp.eventmanagementsystem.entity;

import java.util.List;
import javax.persistence.Column;
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
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int user_id;
    private String name;
    @Column(unique = true)
    private String email;
    @Column(unique = true)
    private Long mobilenumber;
    private String password;

    @ManyToMany
    @Cascade(CascadeType.ALL)
    private List<Event> eventlist;

    @OneToMany
    @Cascade(CascadeType.ALL)
    private List<Payment> payments;
    
    @ManyToOne
    @JoinColumn(name = "organizer_id")
    private Event_Organizer organizer;

    public Event_Organizer getOrganizer() {
		return organizer;
	}

	public void setOrganizer(Event_Organizer organizer) {
		this.organizer = organizer;
	}

	// Getters and Setters
    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getMobilenumber() {
        return mobilenumber;
    }

    public void setMobilenumber(Long mobilenumber) {
        this.mobilenumber = mobilenumber;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Event> getEvents() {
        return eventlist;
    }

    public void setEvents(List<Event> events) {
        this.eventlist = events;
    }

    public List<Payment> getPayments() {
        return payments;
    }

    public void setPayments(List<Payment> payments) {
        this.payments = payments;
    }
}
