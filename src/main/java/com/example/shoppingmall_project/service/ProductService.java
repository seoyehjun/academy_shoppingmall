package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.ProductDAO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductDAO dao;

//    @Value("file:E:/boardImg/")
//    private Resource dir;


    public List<ProductVO> getProduct() {

        return dao.productlist();
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

    public List<ProductVO> productList() {
        return dao.productlist();
    }

    public List<ProductVO> productList(int idx) {
        return dao.productlist();
    }

}