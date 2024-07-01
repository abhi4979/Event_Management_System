package com.jsp.eventmanagementsystem.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;



@Entity
public class Event_Organizer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int org_id;
    
    private String name;
    
    @Column(unique = true)
    private String email;
    
    @Column(unique = true)
    private Long mobilenumber;
    
    private String company_name;
    private String password;
    
    @OneToMany(mappedBy = "organizer")
    @Cascade(CascadeType.ALL)
    private List<Event> events = new ArrayList<>();
    
    @OneToMany
    private List<User> user;
    
    @OneToMany 
    private List<Payment> payment;

    public List<Payment> getPayment() {
		return payment;
	}

	public void setPayment(List<Payment> payment) {
		this.payment = payment;
	}

	// Getters and Setters
    public int getOrg_id() {
        return org_id;
    }

    public void setOrg_id(int org_id) {
        this.org_id = org_id;
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

    public String getCompany_name() {
        return company_name;
    }

    public void setCompany_name(String company_name) {
        this.company_name = company_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Event> getEvent() {
        return events;
    }

    public void setEvent(List<Event> event) {
        this.events = event;
    }

  
}
