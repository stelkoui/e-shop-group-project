/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.dao.OrdersDao;
import com.mycompany.entities.Orders;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;


public class OrderHistoryImpl implements OrderHistory {
    
    @Autowired
    OrdersDao odao;

    @Override
    public List<Orders> getAllOrders() {
        return odao.findAll();
    }

    @Override
    public void createOrUpdateOrder(Orders ord) {
         odao.createOrUpdate(ord);
    }
    
}
