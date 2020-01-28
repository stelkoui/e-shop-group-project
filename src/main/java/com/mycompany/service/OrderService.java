package com.mycompany.service;

import com.mycompany.dao.ProductDao;
import com.mycompany.entities.OrderDetail;
import com.mycompany.entities.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    
     @Autowired
    ProductDao pdao;

    public List<Product> getProducts() {
       
           
        return pdao.findAll();
    }

    public Product getProductByName(String name) {
        for (Product p : getProducts()) {
            if (p.getPcategory().equals(name)) {
                return p;
            }
        }
        return null;
    }
    
//    public OrderDetail prepareOrderDetail(OrderDetail orderDetail){
//        float subtotal = 0.0f;
//        for(Product p: orderDetail.getProducts()){
//            subtotal += p.getPprice();
//        }
//        orderDetail.setProductName(orderDetail.getProducts().toString());
//        orderDetail.setSubtotal(subtotal);
//        orderDetail.setShipping(2f);
//        orderDetail.setTax(5f);
//        orderDetail.setTotal(subtotal+2+5);
//        return orderDetail;
//    }
    
    public OrderDetail prepareOrderDetail(List<Product> productList){
        float subtotal = 0.0f;
        for(Product p: productList){
            subtotal += p.getPprice();
        }
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setProducts(productList);
        orderDetail.setSubtotal(subtotal);
        orderDetail.setShipping(2f);
        orderDetail.setTax(5f);
        orderDetail.setTotal(subtotal+2+5);
        return orderDetail;
    }
}
