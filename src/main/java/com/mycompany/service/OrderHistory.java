/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entities.Orders;
import java.util.List;

/**
 *
 * @author koui
 */
public interface OrderHistory {
     List<Orders> getAllOrders();

    public void createOrUpdateOrder(Orders ord);
}
