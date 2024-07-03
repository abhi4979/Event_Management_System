package com.jsp.eventmanagementsystem.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.eventmanagementsystem.entity.Admin;


@Repository
public class AdminDao {

	@Autowired
	EntityManagerFactory emf;

	@Autowired
	EntityManager em;

	@Autowired
	EntityTransaction et;

	public void saveAdmin(Admin admin) {
		et.begin();
		em.persist(admin);
		et.commit();
	}

	public Admin findById(int id) {
		return em.find(Admin.class, id);
	}

	public void updateAdmin(Admin admin) {
		et.begin();
		em.merge(admin);
		et.commit();
	}

	public void deleteById(int id) {

		et.begin();
		em.remove(findById(id));
		et.commit();
	}

	public Admin login(String email, String password) {
		Query query = em.createQuery("select a from Admin a where a.email=?1 and a.password=?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		try {
			Admin admin = (Admin) query.getSingleResult();
			return admin;
		} catch (Exception e) {
			return null;
		}
	}
	public Admin forgotPassword(String email,Long mob) {
		Query query=em.createQuery("select a from Admin a where a.email=?1 and a.mobilenumber=?2");
		query.setParameter(1, email);
		query.setParameter(2, mob);
		try {
			Admin admin = (Admin) query.getSingleResult();
			return admin;
		} catch (Exception e) {
			return null;
		}
		
	}


}

