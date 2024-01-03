package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.vo.*;
import com.example.shoppingmall_project.model.adminDAO;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.attribute.*;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class AdminService {

    @Autowired
    private adminDAO dao;

//    @Value("file:E:/boardImg/")
//    private Resource dir;
//


    public void product_delete(int productsIdx) {
         dao.product_delete(productsIdx);
         dao.product_delete_color(productsIdx);
         dao.product_delete_size(productsIdx);
    }

    public void product_update(ProductVO input) {
            dao.product_update(input);
    }

    public ProductVO getProductOne(int products_Idx) { return dao.selectOne(products_Idx);}



    public List<AdminOrdersVO> orderlist() {
            return dao.orderSelectAll();
    }

    public AdminOrdersVO getOrdersOne(int orders_idx){
        return dao.orderSelectOne(orders_idx);
    }

    public int orderUpdate(AdminOrdersVO input) {
            return dao.order_update(input);
    }

    public List<CategoriesVO> getCateList() {
        return dao.categoriesAll();
    }


    public void addProductdata(AddProductVO input, List<Integer> sizes, List<Integer> colors, MultipartFile[] files){
//
        System.out.println("TEST : cate : " + input.getCategories_idx());

        AddProductVO productInfo = new AddProductVO(
                input.getCategories_idx(),
                input.getProducts_name(),
                input.getProducts_price(),
                input.getProducts_stock()
        );
        System.out.println("TEST : cate2 : " + productInfo.getCategories_idx());
        System.out.println("TEST : name2 : " + productInfo.getProducts_name());
        System.out.println("TEST : price2 : " + productInfo.getProducts_price());
        System.out.println("TEST : stock2 : " + productInfo.getProducts_stock());
        dao.insertProduct(productInfo);

        System.out.println("TEST2 : " + productInfo.getProducts_idx());
        int products_idx = productInfo.getProducts_idx();

        System.out.println(products_idx);

        if(sizes != null){
            for (Integer sizeIdx : sizes) {
                dao.insertProductSize(products_idx, sizeIdx);
            }
        }

        if(colors != null){
            for(Integer colorIdx : colors){
                dao.insertProductColor(products_idx, colorIdx);
            }
        }

        if (files != null){
            // 생성 되는 시퀀스 번호의 폴더 생성
            Path directoryPath = Paths.get("c:\\springboot\\" + products_idx);

            try {
                Files.createDirectory(directoryPath);
                System.out.println("TEST : " + directoryPath + " 생성 되었습니다.");

            // 윈도우 환경에서 폴더 권한 설정
                UserPrincipalLookupService lookupService = FileSystems.getDefault().getUserPrincipalLookupService();
                UserPrincipal user = lookupService.lookupPrincipalByName(System.getProperty("user.name"));

                AclFileAttributeView view = Files.getFileAttributeView(directoryPath, AclFileAttributeView.class);
                AclEntry entry = AclEntry.newBuilder()
                        .setType(AclEntryType.ALLOW)
                        .setPrincipal(user)
                        .setPermissions(AclEntryPermission.READ_DATA, AclEntryPermission.WRITE_DATA,
                                AclEntryPermission.APPEND_DATA)
                        .build();

                List<AclEntry> acl = view.getAcl();
                acl.add(0, entry);
                view.setAcl(acl);


                }catch (FileAlreadyExistsException e) {
                System.out.println("디렉토리가 이미 존재합니다.");

            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            
            // 이미지들을 해당 시퀀스 폴더에 저장
            for(MultipartFile imgIdx : files){

                // 파일 이름 추출
                String fileName = imgIdx.getOriginalFilename();
                System.out.println(fileName);

                try {
                    imgIdx.transferTo(directoryPath.resolve(Objects.requireNonNull(fileName)));
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }

                dao.insertProductImg(products_idx, fileName);


            }








        }

    }



    public List<SizeVO> getSizeList() {
        return dao.sizeAll();
    }

    public List<ColorVO> getColorList() { return dao.colorAll();
    }
}


