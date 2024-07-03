package com.jsp.eventmanagementsystem.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.eventmanagementsystem.entity.Admin;
import com.jsp.eventmanagementsystem.entity.Event_Organizer;

@Repository
public class OrganizerDao {
	
		@Autowired
		EntityManagerFactory emf;

		@Autowired
		EntityManager em;

		@Autowired
		EntityTransaction et;

		public void saveOrganizer(Event_Organizer organizer) {
			et.begin();
			em.persist(organizer);
			et.commit();
		}

		public Event_Organizer findById(int id) {
			return em.find(Event_Organizer.class, id);
		}

		public void updateOrganizer(Event_Organizer organizer) {
			et.begin();
			em.merge(organizer);
			et.commit();
		}

		public void deleteById(int id) {

			et.begin();
			em.remove(findById(id));
			et.commit();
		}

		public Event_Organizer login(String email, String password) {
			Query query = em.createQuery("select a from Event_Organizer a where a.email=?1 and a.password=?2");
			query.setParameter(1, email);
			query.setParameter(2, password);
			try {
				Event_Organizer organizer = (Event_Organizer) query.getSingleResult();
				return organizer;
			} catch (Exception e) {
				return null;
			}
		}
      public List<Event_Organizer> fetchUnapprovedOrganizers() {
    	  Query query=em.createQuery("select a from Event_Organizer a where a.status='Not Approved'");
    	  return (List<Event_Organizer>)query.getResultList();
      }
      public List<Event_Organizer> viewAllEventOrganizers() {
    	  Query query=em.createQuery("select a from Event_Organizer a");
    	  return query.getResultList();
      }
      public Event_Organizer forgotPassword(String email,Long mob) {
  		Query query=em.createQuery("select a from Event_Organizer a where a.email=?1 and a.mobilenumber=?2");
  		query.setParameter(1, email);
  		query.setParameter(2, mob);
  		try {
  			Event_Organizer org = (Event_Organizer) query.getSingleResult();
  			return org;
  		} catch (Exception e) {
  			return null;
  		}
  		
  	}
      
	}
