/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.dao;

import com.mycompany.entities.Product;
import java.util.List;

/**
 *
 * @author koui
 */
public interface ProductDao {

    public List<Product> findAll();

    public void createOrUpdate(Product p);

    public void delete(Integer id);

    public Product findById(Integer id);

    public List<Product> findByUserCriteria(String searchCriteria);

    public List<Product> findByGender(String searchCriteria, String pgender);
    
    
    public List<Product> findForMen(String category);

    public List<Product> findForWomen(String category);

    public List<Product> findForKids(String category);
    
}
