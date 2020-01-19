/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entities.Message;
import java.util.List;

/**
 *
 * @author koui
 */
public interface MessageService {
    
    public void createMessage(Message s);
    
    public List<Message> getMessages();
    
        public void deleteMessage(Integer id);

}
