/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entities.Message;
import java.util.List;


public interface MessageDao {
    
        public void create(Message s);

    public List<Message> findMessages();

    public void delete(Integer id);

    
}
