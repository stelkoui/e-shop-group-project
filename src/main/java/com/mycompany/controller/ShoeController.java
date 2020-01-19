package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/shoes/result")
public class ShoeController {
    
    @RequestMapping
    public String home(){
        return "shoesList";
    }
    
}
