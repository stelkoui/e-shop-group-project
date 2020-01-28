package com.mycompany.controller;

import com.mycompany.entities.Product;
import com.mycompany.service.ProductService;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    ProductService service;

    @GetMapping("/list")
    public String showProducts( Model m ) {
        List<Product> list = service.getAllProducts();
        m.addAttribute("listOfProduct", list);
        return "listProduct";
    }
    

    @GetMapping("/create")
    public String showForm(@ModelAttribute("product") Product p) {
        return "formProduct";
    }

    @PostMapping("/create")
    public String createOrUpdateProduct(@Valid Product p, BindingResult result) {
        if (result.hasErrors()) {
            return "formProduct";
        }
        service.createOrUpdateProduct(p);
        return "redirect:/product/list";
    }

    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("productId") int id) {
        service.deleteProduct(id);
        return "redirect:/product/list";
    }

    @GetMapping("/update")
    public String showUpdateForm(@RequestParam("productId") Integer id, Model m) {

        Product p = service.findProductById(id);
        m.addAttribute("product", p);
        return "formProduct";
    }
    
    @GetMapping("/search")
    public String showProductsByName(@RequestParam("searchCriteria") String searchCriteria, Model m){
        List<Product> list = service.findProductsByUserCriteria(searchCriteria);
        m.addAttribute("listOfProduct", list);
        if(list.isEmpty()){
            return "redirect:/";
        }
        return "productList";
    }

      @GetMapping("/men")
    public String showProductsForMen(@RequestParam("category") String category, Model m){
        List<Product> list = service.findProductsForMen(category);
        m.addAttribute("listOfProduct", list);
        
        return "productList";
    }
    
    @GetMapping("/women")
    public String showProductsForWomen(@RequestParam("category") String category, Model m){
        List<Product> list = service.findProductsForWomen(category);
        m.addAttribute("listOfProduct", list);
        
        return "productList";
    }
    
    @GetMapping("/kids")
    public String showProductsForKids(@RequestParam("category") String category, Model m){
        List<Product> list = service.findProductsForKids(category);
        m.addAttribute("listOfProduct", list);
        
        return "productList";
    }
    
}
