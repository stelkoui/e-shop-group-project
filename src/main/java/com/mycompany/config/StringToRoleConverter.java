/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.config;

import com.mycompany.entities.Role;
import com.mycompany.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToRoleConverter implements Converter<Object,Role>{
    
    @Autowired
    RoleService roleService;

    @Override
    public Role convert(Object source) {
        Integer id= Integer.parseInt((String)source);
        Role role=roleService.findById(id);
        
        return role;

    }
    
    
    
}
