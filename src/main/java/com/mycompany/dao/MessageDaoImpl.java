/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entities.Message;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class MessageDaoImpl implements MessageDao{
    
      @Autowired
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();

    }

    @Override
    public void create(Message s) {
       getSession().save(s);

    }

    @Override
    public List<Message> findMessages() {
        Query q = getSession().createQuery("SELECT m FROM Message m");
        List<Message> list = q.getResultList();
        return list;
    }

    @Override
    public void delete(Integer id) {
        String query = "DELETE FROM Message m WHERE m.mid=:id";
        Query q = getSession().createQuery(query);
        q.setParameter("id", id);
        int result = q.executeUpdate();
    }
    
}
