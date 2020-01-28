/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.service;

import com.mycompany.entities.Product;
import java.util.List;

public interface ProductService {

    List<Product> getAllProducts();

    public void createOrUpdateProduct(Product p);

    public void deleteProduct(Integer id);

    public Product findProductById(Integer id);

    public List<Product> findProductsByUserCriteria(String searchCriteria);

    public List<Product> findProductsByGender(String searchCriteria, String pgender);
    
    
    public List<Product> findProductsForMen(String category);

    public List<Product> findProductsForWomen(String category);

    public List<Product> findProductsForKids(String category);

}
