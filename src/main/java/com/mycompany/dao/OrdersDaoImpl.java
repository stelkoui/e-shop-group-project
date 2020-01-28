/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entities.Orders;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author koui
 */
public class OrdersDaoImpl implements OrdersDao{
    
      @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();

    }

    @Override
    public List<Orders> findAll() {
                Query q = getSession().createNamedQuery("Orders.findAll");
                List<Orders> list=q.getResultList();
                return list;
    }

    @Override
    public void createOrUpdate(Orders ord) {
                getSession().saveOrUpdate(ord);

    }
    
}
