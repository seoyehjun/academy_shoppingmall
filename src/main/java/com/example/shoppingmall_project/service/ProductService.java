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

        return dao.selectAll();
    }

    public List<ProductVO> getProductOne(int productIdx) {

        return dao.selectOne(productIdx);
    }


    public int getCount() {

        return dao.countAll();
    }


    public Object color() {
        // TODO Auto-generated method stub
        return dao.colorAll();
    }


    public Object getimg() {
        return dao.imgAll();
    }


    public ProductVO getProductByIdx(int productIdx) {
        return dao.selectProductByIdx(productIdx);
    }

    public List<ProductVO> productList() {
        return dao.productlist();
    }


//    public int addProductdata(ProductVO input) {
//
//        MultipartFile file = input.getUpload();
//        input.setImg(file.getOriginalFilename());
//    }
}