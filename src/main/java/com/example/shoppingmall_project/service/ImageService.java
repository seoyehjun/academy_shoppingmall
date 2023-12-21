package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.ImageDAO;
import com.example.shoppingmall_project.model.ProductDAO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;

@Service
public class ImageService {

    @Autowired
    private ImageDAO imageDAO;

    public List<String> getAllImageNames() {
        return imageDAO.getAllImageNames();
    }

    public ProductVO getMenuImage(int idx) {
        return imageDAO.getMenuImageNames(idx);
    }

    public void addImage(Model model){
        model.addAttribute("imageList", getAllImageNames());
    }
}
