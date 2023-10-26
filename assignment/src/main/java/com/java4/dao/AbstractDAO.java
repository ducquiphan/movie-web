package com.java4.dao;

import java.util.List;
import java.util.Map;

import com.java4.utils.JPAUtils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.StoredProcedureQuery;
import jakarta.persistence.TypedQuery;

public abstract class AbstractDAO<T> {
	public static final EntityManager ENTITY_MANAGER = JPAUtils.getEntityManager();
	@SuppressWarnings("deprecation")
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		//ENTITY_MANAGER.close();
		super.finalize();
	}
	
	public T findById(Class<T> class1, Integer id) {
		return ENTITY_MANAGER.find(class1, id);
	}
	
	public List<T> findAll(Class<T> class1, boolean existIsActive) {
		String entityName = class1.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("select o from ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" where isActive = 1");
		}
		System.out.println(sql.toString());
		TypedQuery<T> query = ENTITY_MANAGER.createQuery(sql.toString(), class1);
		
		// Select o from T o where isActive = 1;
		return query.getResultList();
	}
	
	public List<T> findAll(Class<T> class1, boolean existIsActive, int pageNumber, int pageSize) {
		String entityName = class1.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("select o from ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" where isActive = 1");
		}
		
		TypedQuery<T> query = ENTITY_MANAGER.createQuery(sql.toString(), class1);
		query.setFirstResult((pageNumber-1) * pageSize);
		query.setMaxResults(pageSize);
		
		// Select o from T o where isActive = 1;
		return query.getResultList();
	}
	
	// select o from User o where o.username = ?0 and o.password = ?1;
	public T findOne(Class<T> class1, String sql, Object... params) {
		TypedQuery<T> query = ENTITY_MANAGER.createQuery(sql,class1);
		for (int i = 1; i <= params.length; i++) {
			query.setParameter(i, params[i-1]);
		}
		List<T> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<T> findMany(Class<T> class1, String sql, Object... params) {
		TypedQuery<T> query = ENTITY_MANAGER.createQuery(sql,class1);
		for (int i = 1; i <= params.length; i++) {
			query.setParameter(i, params[i-1]);
		}
		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> findManyByNaiveQuery(String sql, Object... params) {
		Query query = ENTITY_MANAGER.createNativeQuery(sql);
		for (int i = 1; i <= params.length; i++) {
			query.setParameter(i, params[i-1]);
		}
		return query.getResultList();
	}
	
	public T create(T enity) {
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.persist(enity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Create succeed");
			return enity;
		} catch (Exception e) {
			// TODO: handle exception
			ENTITY_MANAGER.getTransaction().rollback();
			System.out.println("Cannot insert entity "+enity.getClass().getSimpleName() +" to DB");
			throw new RuntimeException(e);
		}
	}
	
	public T update(T enity) {
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.merge(enity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Update succeed");
			return enity;
		} catch (Exception e) {
			// TODO: handle exception
			ENTITY_MANAGER.getTransaction().rollback();
			System.out.println("Cannot update entity "+enity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
	}
	
	public T delete(T enity) {
		try {
			ENTITY_MANAGER.getTransaction().begin();
			ENTITY_MANAGER.remove(enity);
			ENTITY_MANAGER.getTransaction().commit();
			System.out.println("Delete succeed");
			return enity;
		} catch (Exception e) {
			// TODO: handle exception
			ENTITY_MANAGER.getTransaction().rollback();
			System.out.println("Cannot delete entity "+enity.getClass().getSimpleName() +" from DB");
			throw new RuntimeException(e);
		}
	}
	
	public List<T> callStored(String namedStored, Map<String, Object> params){
		StoredProcedureQuery query = ENTITY_MANAGER.createNamedStoredProcedureQuery(namedStored);
		params.forEach((key,value) -> query.setParameter(key, value));
		return (List<T>) query.getResultList();
	}
}
