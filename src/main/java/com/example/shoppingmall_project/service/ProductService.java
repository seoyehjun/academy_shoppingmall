package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.ProductDAO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductDAO dao;


    public List<ProductVO> getProduct() {

        return dao.selectAll();
    }

    public List<ProductVO> getProductOne(int productIdx) {

        return dao.selectOne(productIdx);
    }


    public int getCountForProduct(int productIdx) {

        return dao.countAll(productIdx);
    }


    public Object color(int productIdx) {
        return dao.colorAll(productIdx);
    }


    public Object getimg(int productIdx) {
        return dao.imgAll(productIdx);
    }


    public ProductVO getProductByIdx(int productIdx) {
        return dao.selectProductByIdx(productIdx);
    }


}