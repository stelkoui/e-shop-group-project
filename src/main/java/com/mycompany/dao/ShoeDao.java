package com.mycompany.dao;

import com.mycompany.entities.Product;
import java.util.List;

public interface ShoeDao {

    public List<Product> findAll();
    
}
