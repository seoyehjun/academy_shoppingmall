package com.example.shoppingmall_project.service;

import com.example.shoppingmall_project.model.HeaderDAO;
import com.example.shoppingmall_project.model.ProductDAO;
import com.example.shoppingmall_project.model.vo.HeaderVO;
import com.example.shoppingmall_project.model.vo.ProductVO;
import com.example.shoppingmall_project.model.vo.mypagevo.JInquiries_VO;
import com.example.shoppingmall_project.model.vo.mypagevo.Paging;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HeaderService {

    @Autowired private HeaderDAO hdao;
    @Autowired private ProductDAO pdao;

    public List<HeaderVO> getMenu(int idx) {
        List<HeaderVO> list = hdao.getMenu(idx);
        return list;
    }

    public void addCommonAttributes(Model model) {
        model.addAttribute("outer", getMenu(1));
        model.addAttribute("top", getMenu(2));
        model.addAttribute("bottom", getMenu(3));
        model.addAttribute("accessory", getMenu(4));
    }

    public void getImg(Model model){
        model.addAttribute("img", hdao.getImg());
    }

    public void getBanner(Model model){
        model.addAttribute("banner", hdao.getBanner());
    }

    public List<ProductVO> getSub(int idx){
        return hdao.selectSubMenu(idx);
    }

    public List<ProductVO> menuProduct(int idx) {
        return hdao.selectMenu(idx);
    }

    public int totalPage(){
        return hdao.menutotal(1);
    }

    public Map<String, Object> getCategory(Integer reqPage)
    {
        reqPage = reqPage == null ? 1 : reqPage;

        // 페이징 코드 작성
        Paging p = new Paging(reqPage, totalPage());

        // 타입이 다른 객체를 묶어서 반환하기 위해 Map을 사용
        Map<String, Object> result = new HashMap<>();

        result.put("p", p);
        result.put("list", hdao.pagingMenu(p));

        return result;
    }
}
