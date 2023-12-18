package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.ImageDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageService {

    @Autowired
    private ImageDAO imageDAO;

    public List<String> getAllImageNames() {
        return imageDAO.getAllImageNames();
    }
}
