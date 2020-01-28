package com.mycompany.controller;

import com.mycompany.dao.ProductDao;
import com.mycompany.entities.OrderDetail;
import com.mycompany.entities.Orders;
import com.mycompany.entities.Product;
import com.mycompany.entities.ProductEditor;
import com.mycompany.service.OrderHistory;
import com.mycompany.service.OrderService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderController {

    @Autowired
    OrderService service;
    @Autowired
    ProductDao productDao;
  


    @GetMapping("/products")
    public String showProducts(OrderDetail orderDetail, Model model) {

        model.addAttribute("productList", productList());
        return "selectProducts";
    }

    @ModelAttribute("productsList")
    public List<Product> productList() {
        List<Product> products = service.getProducts();
        return products;
    }

    @InitBinder//Create customEditor for converting String to Product
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Product.class,
                new ProductEditor(service));
    }
    

    @PostMapping("/add/cart/{productId}")
    public @ResponseBody Integer addToCart(@PathVariable final int productId, HttpServletRequest request) {
        Product product = productDao.findById(productId);
        System.out.println(product);
        List<Product> productList = (List<Product>) request.getSession().getAttribute("cart");
        if(productList == null){
            productList = new ArrayList<>();
        }
        productList.add(product);
        System.out.println(productList);
        request.getSession().setAttribute("cart",productList);
        
        int total=0;
        for(Product p:productList){
            total+=p.getPprice();
        }
      

        return total;
    }

}
