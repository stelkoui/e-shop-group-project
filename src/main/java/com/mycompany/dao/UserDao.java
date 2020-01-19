/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entities.User;

/**
 *
 * @author koui
 */
public interface UserDao {

    public User findByUsername(String username);

    public void save(User user);
    
}
