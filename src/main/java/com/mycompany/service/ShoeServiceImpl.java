package com.mycompany.service;

import com.mycompany.dao.ShoeDao;
import com.mycompany.entities.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ShoeServiceImpl implements ShoeService{

    @Autowired
    ShoeDao sdao;

    @Override
    public List<Product> getAllShoes() {
        List<Product> list = sdao.findAll();
        return list;
    }
        
}
