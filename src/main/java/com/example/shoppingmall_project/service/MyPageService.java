package com.example.shoppingmall_project.service;

import java.util.List;
import java.util.Map;

import com.example.shoppingmall_project.model.MyPageDAO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.mypagevo.Cart_vo;
import com.example.shoppingmall_project.model.vo.mypagevo.O_OD_P_C_S_M_vo;
import com.example.shoppingmall_project.model.vo.mypagevo.O_P_OD_vo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;

	public boolean modifyCartQty(Cart_vo cartVO) throws Exception{
		boolean result=true;
		myPageDAO.updateCartQty(cartVO);
		System.out.println("cart quantity" +cartVO.getQuantity());
		return result;
	}

	public void deleteMyOrder(String orders_idx) throws Exception
	{
		myPageDAO.deleteMyOrder(orders_idx);
	}

	public List<Cart_vo> myCartList(int members_idx) throws Exception
	{
		List<Cart_vo> myCartList=myPageDAO.listMyCart(members_idx+"");
		if(myCartList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		return myCartList;
	}

	public List<O_P_OD_vo> listMyOrderGoods(String members_idx) throws Exception
	{
		System.out.println("members_idx: "+members_idx);
		return myPageDAO.listMyOrderGoods(members_idx);
	}
	
	public MembersVO givememember(int members_idx) throws Exception
	{
		return myPageDAO.givememember(members_idx);
	}
	
	public MembersVO modifyMyInfo(Map memberMap) throws Exception
	{
		String members_idx = (String)memberMap.get("members_idx");
		myPageDAO.updateMyInfo(memberMap);
		return givememember(Integer.parseInt(members_idx));
	}
	
	public O_OD_P_C_S_M_vo getOrderDetail(int orders_idx)throws Exception
	{
		return myPageDAO.getOrderDetail(orders_idx);
	}
}
