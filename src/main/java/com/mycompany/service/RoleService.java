/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entities.Role;
import java.util.List;

/**
 *
 * @author koui
 */
public interface RoleService {

    public List<Role> getRoles();

    public Role findById(Integer id);
    
}
