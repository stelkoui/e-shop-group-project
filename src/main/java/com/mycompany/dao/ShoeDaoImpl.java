package com.mycompany.dao;

import com.mycompany.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShoeDaoImpl implements ShoeDao{
    
    @Autowired
    SessionFactory sessionFactory;
    
    private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
    
    @Override
    public List<Product> findAll() {
        Query q = getSession().createQuery("from Product");
        List<Product> list = q.getResultList();
        return list;
    }
}
