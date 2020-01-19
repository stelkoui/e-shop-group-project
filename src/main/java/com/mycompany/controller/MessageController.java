/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.controller;

import com.mycompany.entities.Message;
import com.mycompany.entities.Product;
import com.mycompany.service.MessageService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/message")
public class MessageController {
   
    
    @Autowired
    MessageService serv;
    
 @GetMapping("/send")
    public String showFormMessage(@ModelAttribute("message") Message s) {
        return "formMessage";
    }
    
     @PostMapping("/send")
    public String createMessage(@Valid Message s, BindingResult result) {
        if (result.hasErrors()) {
            return "formMessage";
        }
        serv.createMessage(s);
        return "redirect:/";
    }
    
    @GetMapping("/list")
    public String showMessages(Model m) {
        List<Message> list = serv.getMessages();
        m.addAttribute("listOfMessages", list);
        return "listMessage";
    }
    
     @GetMapping("/delete")
    public String deleteMessage(@RequestParam("messageId") int id) {
        serv.deleteMessage(id);
        return "redirect:/message/list";
    }
    
}
