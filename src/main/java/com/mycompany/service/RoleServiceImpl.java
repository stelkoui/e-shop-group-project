/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.RoleDao;
import com.mycompany.entities.Role;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author koui
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService{
    
    @Autowired
    RoleDao rdao;

    @Override
    public List<Role> getRoles() {
         return rdao.findAll();
    }

    @Override
    public Role findById(Integer id) {
        return rdao.findById(id);
    }
    
}
