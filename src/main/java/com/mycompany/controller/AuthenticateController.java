
package com.mycompany.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class AuthenticateController {
    
    
    
    @GetMapping("/loginPage")
    public String showLoginForm(){
        return "login2";
    }
    @GetMapping("/access-denied")
    public String showAccess(){
        return "access-denied";
    }
    
}
