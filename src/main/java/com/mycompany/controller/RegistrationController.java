package com.mycompany.controller;

import com.mycompany.entities.Role;
import com.mycompany.entities.User;
import com.mycompany.service.RoleService;
import com.mycompany.service.UserService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/register")
public class RegistrationController {
    
    @Autowired
    UserService userService;
    
    @Autowired
    RoleService roleService;
    
    @GetMapping("/showForm")
    public String showRegistrationForm(Model m){
        m.addAttribute("user", new User());
        return "registration-form";
    }
    
    @ModelAttribute("roloi")
    public List<Role> fereRoles(){
        return roleService.getRoles();
    } 
    @ModelAttribute("roloi2")
    public Role  fereRole(){
        List<Role> list=roleService.getRoles();
        Role r=list.get(1);
        return r;
    }
    
    
    @PostMapping("/processRegistration")
    public String processRegistration(@Valid @ModelAttribute("user") User user, 
            BindingResult result, 
            Model m, HttpServletRequest request){
        if(result.hasErrors()){
            return "registration-form";
        }
        User existing=userService.findByUsername(user.getUsername());
        if(existing!= null){
            m.addAttribute("user",new User());
            m.addAttribute("userExistsError","Username exists");
            return "registration-form";
        }
        if(user.getRoles()==null   || user.getRoles().isEmpty()){
            user.addRole(new Role(2,"ROLE_USER"));
        }
        userService.save(user);
        request.getSession().setAttribute("logedinuser", user);
        return "registration-confirmation";
    }
    
}



