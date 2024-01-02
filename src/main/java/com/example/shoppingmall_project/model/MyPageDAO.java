package com.example.shoppingmall_project.model;

import java.util.List;
import java.util.Map;

import com.example.shoppingmall_project.model.vo.InquiriesVO;
import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.mypagevo.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;



@Repository
@Mapper
public interface MyPageDAO 
{


	@Insert("insert into cart(quantity, products_idx, members_idx, color_idx, size_idx) " +
			" select 1 as quantity," +
			" (select products_idx from favorites where favorites_idx = #{favorites_idx})," +
			" (select members_idx from favorites where favorites_idx = #{favorites_idx})," +
			" (select color_idx from favorites where favorites_idx = #{favorites_idx}), " +
			" (select size_idx from favorites where favorites_idx = #{favorites_idx}) " +
			" from dual")
	public void toCartfromWish(int favorites_idx);
	@Delete("delete from favorites" +
			" where favorites_idx = #{favorites_idx}")
	public void removeWish(int favorites_idx);
	@Select("select f.favorites_idx, f.products_idx, f.members_idx, f.color_idx, f.size_idx, " +
			"       p.products_name, p.products_price, st.size_product, ct.color/*, pi.img_url*/" +
			" from favorites f, products p, size_table st, color ct, products_color pc, products_size ps/*, products_img pi*/" +
			" where f.members_idx = #{members_idx}" +
			"  and f.products_idx = p.products_idx" +
			"  /*and p.products_idx = pi.products_idx*/" +
			"  and f.products_idx = pc.products_idx" +
			"  and pc.color_idx = ct.color_idx" +
			"  and f.color_idx = pc.color_idx" +
			"  and f.products_idx = ps.products_idx" +
			"  and ps.size_idx = st.size_idx" +
			"  and f.size_idx = ps.size_idx")
	public List<FavoritesVO> getwishlist(int members_idx);

	@Select("select * from replys r " +
			"where inquiries_idx = #{inquiries_idx}")
	public List<ReplyVO> selectAllReplys(int inquiries_idx);

	@Insert(
			"insert into Inquiries(inquiries_title, inquiries_content" +
					",inquiries_registration_date,inquiries_category,products_idx,members_idx) " +
					"values(#{inquiries_title}, #{inquiries_content}," +
					"sysdate, #{inquiries_category}, 1, 1) "
	)//products_idx는 임의로 7로 고정시켜놓음 만약 상품페이지에서 문의글을 쓰고싶다면 조작해도될듯하다.
	public void InfoInsert(JInquiries_VO vo);

	@Select("SELECT * "
			+"FROM members m, inquiries i "
			+"WHERE i.inquiries_idx=#{no} "
			+"AND i.members_idx = m.members_idx ")
	public JInquiries_VO boardDetailData(int no);

	@Select("select count(*) from inquiries")
	int totalInqury();


	@Select("select * from inquiries i, members m " +
			"where i.members_idx = m.members_idx " +
			"order by inquiries_idx desc " +
			"offset #{offset} row " +
			"fetch first #{perCount} rows only")
	List<JInquiries_VO> selectAll(Paging p);

	@Select("select c.cart_idx, c.quantity, c.products_idx, c.members_idx,c.color_idx, c.size_idx"+
			" , p.products_name, p.products_price, st.size_product, ct.color" +
			" from cart c, products p, size_table st, color ct,products_color pc, products_size ps, members m" +
			" where #{members_idx}= c.members_idx" +
			" and m.members_idx = #{members_idx}" +
			" and c.cart_idx = #{cart_idx} " +
			" and c.products_idx = p.products_idx" +
			" and c.products_idx = pc.products_idx and pc.color_idx = ct.color_idx and c.color_idx = pc.color_idx" +
			" and c.products_idx = ps.products_idx and ps.size_idx = st.size_idx and c.size_idx = ps.size_idx"
	)
	Cart_vo orderCartGoods(String cart_idx, int members_idx);

	@Select("select o.orders_idx, o.orders_date, o.orders_status"
			+ ",p.products_name, p.products_idx, od.quantity"
			+ "	from orders o, products p, ordersd_details od "  
			+ "		where od.orders_idx = o.orders_idx"
			+ "		and od.products_idx = p.products_idx"
			+ "		and members_idx = #{members_idx} " 
			+ "		order by o.orders_date desc")
	List<O_P_OD_vo> listMyOrderGoods(String members_idx);
	
	@Select("select * from members " + 
			"            where members_idx=#{members_idx} " )
	MembersVO givememember(int members_idx);
	
	@Select("select c.cart_idx, c.quantity, c.products_idx, c.members_idx,c.color_idx, c.size_idx"
			+ " , p.products_name, p.products_price, st.size_product, ct.color/*, pi.img_url*/" +
			" from cart c, products p, size_table st, color ct,products_color pc, products_size ps, members m/*,products_img pi*/" +
			" where #{members_idx}= c.members_idx" + 
			" and m.members_idx = #{members_idx}" + 
			" and c.products_idx = p.products_idx" +
			//" and p.products_idx = pi.products_idx" +
			" and c.products_idx = pc.products_idx and pc.color_idx = ct.color_idx and c.color_idx = pc.color_idx" + 
			" and c.products_idx = ps.products_idx and ps.size_idx = st.size_idx and c.size_idx = ps.size_idx")
	List<Cart_vo> listMyCart(String members_idx);

	@Select("select o.orders_idx, o.orders_date, o.orders_status" + 
			"			,o.orders_address, o.orders_detailed_address" +
			"			,o.orders_recipient_phone, o.orders_recipient_name" + 
			"			,od.quantity" + 
			"			,p.products_idx, p.products_name, p.products_price " + 
			//"			,pi.img_url" +
			"			,c.color" + 
			"			,st.size_product" + 
			"			from orders o, ordersd_details od, products p/*, products_img pi*/, color c, size_table st" +
			"			,products_color pc, products_size ps " + 
			"            where o.orders_idx = od.orders_idx" + 
			"            and od.products_idx = p.products_idx" + 
			//"            and p.products_idx = pi.products_idx" +
			"            and ps.size_idx = od.size_idx and ps.products_idx = od.products_idx and ps.size_idx = st.size_idx" + 
			"            and pc.color_idx = od.color_idx and pc.products_idx = od.products_idx and pc.color_idx = c.color_idx " + 
			"            and o.orders_idx = #{orders_idx}")
	List<O_OD_P_C_S_M_vo> getOrderDetail(int orders_idx);


	@Delete("delete from cart " +
			"where cart_idx=#{cart_idx}")
	void removeCart(String cart_idx);

	@Update("update orders " +
			"set orders_status ='주문취소됨' " +
			"where orders_idx=#{orders_idx}")
	void deleteMyOrder(String orders_idx);
	void updateMyInfo(Map memberMap);

	@Update(
			"update cart " +
					"set quantity=#{quantity}" +
					"where members_idx=#{members_idx}" +
					"and cart_idx=#{cart_idx}"
	)
	void updateCartQty(Cart_vo cartVO);
}
