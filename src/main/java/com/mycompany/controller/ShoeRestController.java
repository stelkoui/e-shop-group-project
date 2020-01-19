package com.mycompany.controller;

import com.mycompany.entities.Product;
import com.mycompany.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/shoes")
public class ShoeRestController {
    @Autowired
    ProductService service;
    
    @GetMapping
    public ResponseEntity<List<Product>> list(){
        List<Product> list = service.getAllProducts();
        return ResponseEntity.ok().body(list);
    }
}
