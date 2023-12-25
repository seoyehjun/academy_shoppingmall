package com.example.shoppingmall_project.Configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ImageConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){

        registry.addResourceHandler("/springboot/**").addResourceLocations("file:///C:/springboot/");
        String[] imageUrls = getImageUrls();
        for (String imageUrl : imageUrls) {
            registry.addResourceHandler("/springboot/" + imageUrl).addResourceLocations("file:///C:/springboot/" + imageUrl);
        }
    }

    private String[] getImageUrls() {
        String imgUrlsString = "image1.jpg,image2.jpg,image3.jpg";
        return imgUrlsString.split(",");
    }
}
