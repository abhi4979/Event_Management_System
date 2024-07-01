package com.jsp.eventmanagementsystem.dao;

import java.time.LocalDate;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.eventmanagementsystem.entity.Event;


@Repository
public class EventDao {
	@Autowired
	EntityManagerFactory emf;

	@Autowired
	EntityManager em;

	@Autowired
	EntityTransaction et;

	public void saveEvent(Event event) {
		et.begin();
		em.persist(event);
		et.commit();
	}

	public Event findById(int id) {
		return em.find(Event.class, id);
	}
    @Transactional
	public void updateEvent(Event event) {
		et.begin();
		em.merge(event);
		et.commit();
	}

	public void deleteById(int id) {

		et.begin();
		em.remove(findById(id));
		et.commit();
	}
	public List<Event> viewAllEvent() {
		Query query=em.createQuery("select a from Event a");
		List<Event> event=query.getResultList();
		return event;
		
	}
	public List<Event> viewSearchEvent(String location,LocalDate date,String type){
		Query query=em.createQuery("select a from Event a where a.location=:location and a.date=:date and a.type=:type");
		query.setParameter("location", location);
		query.setParameter("date", date);
		query.setParameter("type", type);
		return query.getResultList();
	}
	public List<Event> viewFilterEvent(Double mincost,Double maxcost ){
		Query query=em.createQuery("select a from Event a where a.ticket_price between ?1 and ?2");
		  query.setParameter(1, mincost);
		  query.setParameter(2, maxcost);
		  return query.getResultList();
		
	}

}
