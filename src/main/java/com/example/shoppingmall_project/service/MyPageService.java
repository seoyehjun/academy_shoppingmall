package com.example.shoppingmall_project.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.shoppingmall_project.model.MyPageDAO;
import com.example.shoppingmall_project.model.vo.InquiriesVO;
import com.example.shoppingmall_project.model.vo.mypagevo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class MyPageService 
{
	@Autowired
	private MyPageDAO myPageDAO;

	public Map<String, Object> getInfos(Integer idx)
	{
		idx = idx == null ? 1 : idx;

		// 페이징 코드 작성
		Paging p = new Paging(idx, myPageDAO.totalInqury());//페이징객체에 (요청페이지,총페이지수)
		List<InquiriesVO> list = myPageDAO.selectAll(p);

		// 타입이 다른 객체를 묶어서 반환하기 위해 Map을 사용
		Map<String, Object> result = new HashMap<>();

		result.put("p", p);
		result.put("list", list);

		return result;
	}

	public List<Cart_vo> orderCartGoods(String[] cart_list,int members_idx) throws Exception
	{
		List<Cart_vo> list= new ArrayList<Cart_vo>();
		for(int i=0;i<cart_list.length;i++)
		{
			list.add(myPageDAO.orderCartGoods(cart_list[i],members_idx) );
		}
		System.out.println("list[0].cart_idx: "+list.get(0).getCart_idx());

		return list;
	}

	public boolean modifyCartQty(Cart_vo cartVO) throws Exception{
		boolean result=true;
		myPageDAO.updateCartQty(cartVO);
		System.out.println("cart quantity" +cartVO.getQuantity());
		return result;
	}

	public void removeCart(String cart_idx) throws Exception
	{
		myPageDAO.removeCart(cart_idx);
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
	
	public MemberVO givememember(int members_idx) throws Exception
	{
		return myPageDAO.givememember(members_idx);
	}
	
	public MemberVO modifyMyInfo(Map memberMap) throws Exception
	{
		System.out.println("in service");
		String members_idx = (String)memberMap.get("members_idx");
		myPageDAO.updateMyInfo(memberMap);
		return givememember(Integer.parseInt(members_idx));
	}
	
	public O_OD_P_C_S_M_vo getOrderDetail(int orders_idx)throws Exception
	{
		return myPageDAO.getOrderDetail(orders_idx);
	}
}
