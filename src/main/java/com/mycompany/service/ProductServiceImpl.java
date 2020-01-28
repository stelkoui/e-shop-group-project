
package com.mycompany.service;

import com.mycompany.dao.ProductDao;
import com.mycompany.entities.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{
    
    @Autowired
    ProductDao pdao;

    @Override
    public List<Product> getAllProducts() {
       return  pdao.findAll();
    }

    @Override
    public void createOrUpdateProduct(Product p) {
        pdao.createOrUpdate(p);
    }

    @Override
    public void deleteProduct(Integer id) {
        pdao.delete(id);

    }

    @Override
    public Product findProductById(Integer id) {
        return pdao.findById(id);
    }

    @Override
    public List<Product> findProductsByUserCriteria(String searchCriteria) {
        List<Product> list = pdao.findByUserCriteria(searchCriteria);
        return list;
    }

    @Override
    public List<Product> findProductsByGender(String searchCriteria, String pgender) {
        List<Product> list = pdao.findByGender(searchCriteria, pgender);
        return list;
    }
  @Override
    public List<Product> findProductsForMen(String category) {
        List<Product> list = pdao.findForMen(category);
        return list;
    }

    @Override
    public List<Product> findProductsForWomen(String category) {
        List<Product> list = pdao.findForWomen(category);
        return list;
    }

    @Override
    public List<Product> findProductsForKids(String category) {
        List<Product> list = pdao.findForKids(category);
        return list;
    }
    
}
