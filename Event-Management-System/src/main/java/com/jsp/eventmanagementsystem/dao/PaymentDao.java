package com.jsp.eventmanagementsystem.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsp.eventmanagementsystem.entity.Payment;

@Repository
public class PaymentDao {
	@Autowired
	EntityManagerFactory emf;

	@Autowired
	EntityManager em;

	@Autowired
	EntityTransaction et;

	public void savePayment(Payment payment) {
		et.begin();
		em.persist(payment);
		et.commit();
	}

	public Payment findById(int id) {
		return em.find(Payment.class, id);
	}

	public void updateEvent(Payment payment) {
		et.begin();
		em.merge(payment);
		et.commit();
	}

	public void deleteById(int id) {

		et.begin();
		em.remove(findById(id));
		et.commit();
	}
}
