package com.mycompany.entities;

import com.mycompany.service.OrderService;
import java.beans.PropertyEditorSupport;
import org.springframework.beans.factory.annotation.Autowired;

//Custom ProductEditor to convert String value to Product
public class ProductEditor extends PropertyEditorSupport {

    private OrderService service;
    
    @Autowired//must be autowired in constructor
    public ProductEditor(OrderService service) {
        this.service = service;
    }

    @Override
    public String getAsText() {
        Product p = (Product) getValue();
        return p == null ? "" : p.getPcategory();
    }
    
    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        Product p = service.getProductByName(text);
        super.setValue(p);
    }

}
