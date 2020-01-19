/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.MessageDao;
import com.mycompany.entities.Message;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
public class MessageServiceImpl implements MessageService{
    
    @Autowired
    MessageDao mdao;
    
    @Override
    public void createMessage(Message s) {
        mdao.create(s);
    }

    @Override
    public List<Message> getMessages() {
        return mdao.findMessages();
    }

    @Override
    public void deleteMessage(Integer id) {
        mdao.delete(id);
    }
    
}
