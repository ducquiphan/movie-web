package com.java4.utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAUtils {
	private static EntityManagerFactory factory;

	static public EntityManager getEntityManager() {
		if (factory == null || !factory.isOpen()) {
			factory = Persistence.createEntityManagerFactory("AssignmentJava4");
		}
		return factory.createEntityManager();
	}

	static public void shutdown() {
		if (factory != null && factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
