
package com.mycompany.dao;

import com.mycompany.entities.Orders;
import java.util.List;


public interface OrdersDao {

    public List<Orders> findAll();

    public void createOrUpdate(Orders ord);
    
}
