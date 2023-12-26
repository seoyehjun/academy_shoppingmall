package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.model.adminDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class AdminService {

    @Autowired
    private adminDAO dao;

    @Value("file:E:/boardImg/")
    private Resource dir;

        public int addProductdata(ProductVO input) throws IOException {

            MultipartFile file = input.getUpload();
            input.setImg_url(file.getOriginalFilename());

            int row = dao.insert(input);
            String idx = dao.selectIdx();

            File newDir = new File(dir.getFile(), idx);
            newDir.mkdir();

            File dst = new File(newDir, file.getOriginalFilename());
            file.transferTo(dst);

            return row;
    }

    public int product_delete(int productsIdx) {
        return dao.product_delete(productsIdx);
    }

    public int product_update(ProductVO input) {
            return dao.product_update(input);
    }

    public ProductVO getProductOne(int products_Idx) { return dao.selectOne(products_Idx);}

}


