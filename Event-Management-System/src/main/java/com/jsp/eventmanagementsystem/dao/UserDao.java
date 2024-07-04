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
import com.jsp.eventmanagementsystem.entity.User;

@Repository
public class UserDao {
	@Autowired
	EntityManagerFactory emf;

	@Autowired
	EntityManager em;

	@Autowired
	EntityTransaction et;

	public void saveUser(User user) {
		et.begin();
		em.persist(user);
		et.commit();
	}

	public User findById(int id) {
		return em.find(User.class, id);
	}

	public void updateUser(User user) {
		et.begin();
		em.merge(user);
		et.commit();
	}

	public void deleteById(int id) {

		et.begin();
		em.remove(findById(id));
		et.commit();
	}

	public User login(String email, String password) {
		Query query = em.createQuery("select a from User a where a.email=?1 and a.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		try {
			User user = (User) query.getSingleResult();
			return user;
		} catch (Exception e) {
			return null;
		}
	}
	public List<User> viewAllUsers(){
		Query query=em.createQuery("select u from User u");
		return query.getResultList();
	}
	public User forgotPassword(String email,Long mob) {
		Query query=em.createQuery("select a from User a where a.email=?1 and a.mobilenumber=?2");
		query.setParameter(1, email);
		query.setParameter(2, mob);
		try {
			User  user = (User) query.getSingleResult();
			return user;
		} catch (Exception e) {
			return null;
		}
		
	}
	

}
