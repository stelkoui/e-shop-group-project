
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class HomeController {
    
      
    @RequestMapping
    public String home(){
        return "home";
    }
    
      
    @RequestMapping("/admin")
    public String admin(){
        return "admin";
    }
     
    @RequestMapping("/user")
    public String user(){
        return "user";
    }
   
}
