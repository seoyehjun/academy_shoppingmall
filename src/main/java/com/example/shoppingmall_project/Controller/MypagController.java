//PR이상하게 되어서 다시 커밋후 재시도
package com.example.shoppingmall_project.Controller;

import com.example.shoppingmall_project.model.vo.MembersVO;
import com.example.shoppingmall_project.model.vo.mypagevo.*;
import com.example.shoppingmall_project.service.HeaderService;
import com.example.shoppingmall_project.service.MyPageService;
import net.coobird.thumbnailator.Thumbnails;

import java.io.File;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping(value={"/mypage","/product77"})
public class MypagController
{	
	@Autowired 
	private MyPageService myPageService;
	
	@Autowired
	private OrderVO orderVO;
	//private MemberVO memberVO;

	@Autowired
	private Cart_vo cartVO ;

	@Autowired
	private HeaderService hs;

	@ModelAttribute
	public void mypage(Model model) {
		hs.addCommonAttributes(model);
		hs.getImg(model);
	}

	// https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=sim4858&logNo=221007278858
	// redirect와 뷰네임 차이
	/*@RequestMapping(value="/orderProductforCart", method=RequestMethod.POST)
	public String orderProductforCart(Model model, HttpSession httpsession, HttpServletRequest request,
	@RequestParam("cart_list")  String[] cart_list)
	{
		System.out.println("redirect completed");
		return "/product2/orderProductforCart";
	}*/

	//@GetMapping("/reply")//답변양식으로 이동
	//public String reply_insert(@RequestParam("idx") int inquiries_idx, Model model)
	//{
		//inquiries제목 바꾸기(답변완료)
		//밑에 reply 달아주기

	//	model.addAttribute("replys_list",myPageService.selectAllReplys(inquiries_idx));
	//}



	@PostMapping("/toCartfromWish")
	public String toCartfromWish(Model model, HttpSession httpSession, @RequestParam("favorites_idx") int favorites_idx) throws Exception
	{
		myPageService.toCartfromWish(favorites_idx);
		httpSession.removeAttribute("mywishlist");
		return "redirect:/mypage/wishList";
	}

	@RequestMapping(value="/removeWish", method= RequestMethod.POST)
	public String removeWish(Model model, HttpSession httpsession, @RequestParam("favorites_idx") int favorites_idx) throws Exception
	{
		System.out.println("favorites : "+ favorites_idx);
		myPageService.removeWish(favorites_idx);
		httpsession.setAttribute("message", "remove_Wish");
		return "redirect:/mypage/wishList";
	}
	@GetMapping("/wishList")
	public String go_to_wishlist(Model model, HttpSession httpSession)
	{
		MembersVO user = (MembersVO)httpSession.getAttribute("user");
		httpSession.setAttribute("mywishlist", myPageService.getwishlist(user.getMembers_idx() ) );

		return "/mypage/WishList";
	}

	@PostMapping("/addinquiries")//실제 글을 DB에 넣는 코드 Input값들은 Model로 받아준다.
	public String board_insert_ok(@ModelAttribute JInquiries_VO form, Model model,
								  HttpSession httpsession)
	{
		MembersVO membersVO = (MembersVO)httpsession.getAttribute("user");
		form.setMembers_idx(membersVO.getMembers_idx());
		myPageService.InfoInsert(form);
		return "redirect:/mypage/info";
	}

	@GetMapping("/insert")//글작성 양식으로 이동
	public String board_insert()
	{
		return "mypage/insert";
	}

	@GetMapping("/detail")
	public String Info_detail(String no,Model model)
	{
		//Model => 해당 JSP로 데이터 전송
		// 데이터베이스 연동
		int temp_no = Integer.parseInt(no);
		JInquiries_VO vo = myPageService.InfoDetailData(temp_no);
		List<ReplyVO> replys = myPageService.selectAllReplys(Integer.parseInt(no));
		// 데이터 전송

		System.out.println("replys_length: "+replys.size());
		model.addAttribute("vo", vo);
		model.addAttribute("replys",replys);
		return "mypage/detail";
	}

	@GetMapping(value = {"/info", "/info/{idx}"})
	public String listInfos(Model model, HttpSession httpsession,
					   @PathVariable(required = false) Integer idx)
	{
		// @required의 기본값은 true
		// - idx에 무조건 값이 전달되어야 한다
		System.out.println("info 실행");
		Map<String, Object> result = myPageService.getInfos(idx);

		model.addAttribute("Infolist", result.get("list"));
		model.addAttribute("p", result.get("p"));

		return "/mypage/info";
	}




	@RequestMapping(value="/orderCartGoods",method=RequestMethod.POST)
	public String orderAllCart(Model model, HttpSession httpsession,
							 	@RequestParam(value="cart_list") String[] cart_list,
							   @RequestParam("total_price") int total_price
	) throws Exception
	{
		System.out.println("cart_list[0]: "+cart_list[0]);
		System.out.println("executed");

		MembersVO memberVO = (MembersVO) httpsession.getAttribute("user");//세션 받아오기
		//MembersVO memberVO = myPageService.givememember(getmemberVO.getMembers_idx());
		int members_idx = memberVO.getMembers_idx();

		List<Cart_vo> CO_list = myPageService.orderCartGoods(cart_list, members_idx);

		model.addAttribute("memberInfo", memberVO);
		model.addAttribute("total_price",total_price);
		model.addAttribute("CO_list",CO_list);
		System.out.println("in controller");

		return "/mypage/orderProductforCart";
	}
	@RequestMapping(value="/removeCart", method= RequestMethod.POST)
	public String removeCart(Model model, HttpSession httpsession, @RequestParam("cart_idx") String cart_idx) throws Exception
	{
		myPageService.removeCart(cart_idx);
		httpsession.setAttribute("message", "remove_Cart");
		return "redirect:/mypage/myCartList";
	}
	@RequestMapping(value="/cancelMyOrder", method = RequestMethod.POST)
	public String cancelMyOrder(Model model, HttpSession httpsession, @RequestParam("orders_idx") String orders_idx)throws Exception
	{
		myPageService.deleteMyOrder(orders_idx);
		httpsession.setAttribute("message", "cancel_order");//myPageMain에서 message에 cancel_order가 바인딩 되어있으면
		//주문이 종료되었다는 안내문 뜬다.
		return "redirect:/mypage/myPageMain";
	}
	
	@RequestMapping(value="/myCartList", method = RequestMethod.GET)
	public String myCartList(Model model, HttpSession httpsession, HttpServletRequest request) throws Exception
	{
		HttpSession session=request.getSession();

		MembersVO memberVO=(MembersVO)session.getAttribute("user");
		if(memberVO != null)
		{
			int members_idx = memberVO.getMembers_idx();//세션소유자의 카트 목록 불러올 예정

			List<Cart_vo> cartList = myPageService.myCartList(members_idx);//세션memeber_idx의 cart 리스트를 불러온다.
			session.setAttribute("cartList", cartList);//카트row들과  카트에 들어있는 상품목록 가져온다.cartVO의 리스트들이다.
		}
		else {
			session.removeAttribute("cartList");
		}
		//mav.addObject("cartMap", cartMap);
		return "mypage/myCartList";
	}

	@ResponseBody
	@RequestMapping(value="/modifyCartQty" ,method = RequestMethod.POST)
	public String  modifyCartQty(@RequestParam("cart_idx") int cart_idx,
											   @RequestParam("cart_goods_qty") int cart_goods_qty,
											   HttpServletRequest request, HttpServletResponse response)  throws Exception
	{
		MembersVO memberVO;
		HttpSession session=request.getSession();
		memberVO=(MembersVO)session.getAttribute("user");
		//memberVO = myPageService.givememember(1);
		int members_idx=memberVO.getMembers_idx();
		cartVO.setCart_idx(cart_idx);
		cartVO.setMembers_idx(members_idx);
		cartVO.setQuantity(cart_goods_qty);
		boolean result=myPageService.modifyCartQty(cartVO);
		if(result==true){
			return "modify_success";
		}else{
			return "modify_failed";
		}

	}
	
	@RequestMapping(value = "/myPageMain", method = RequestMethod.GET)
	public String myPageMain(Model model, HttpSession httpsession
			,HttpServletRequest request, @RequestParam(required = false,value="message")  String message)throws Exception
	{
		MembersVO membersVO;
		ModelAndView mav = new ModelAndView();
		membersVO = (MembersVO)httpsession.getAttribute("user");
		//String members_idx = memberVO.getMembers_idx()+"";
		
		//�α��� �����Ǹ� �� ���� �ּ� Ǯ�� members_idx�޾ƿ��� �ȴ�
		List<O_P_OD_vo> myOrderList = myPageService.listMyOrderGoods(membersVO.getMembers_idx()+"");
		httpsession.setAttribute("myOrderList", myOrderList);
		httpsession.setAttribute("message",message);//cancelMyOrder에서 온다.
		System.out.println("myOrderList size: "+myOrderList.size());
		return "mypage/myPageMain";
	}
	@RequestMapping(value = "/myDetailInfo", method = RequestMethod.GET)
	public String myDetailInfo(Model model, HttpSession httpsession
			,HttpServletRequest request)throws Exception
	{
		ModelAndView mav = new ModelAndView();
		

		MembersVO temp_member = (MembersVO)httpsession.getAttribute("user");
		httpsession.setAttribute("memberInfo", temp_member);
		
		return "mypage/myDetailInfo";
	}
	

	// https://velog.io/@dhk22/Spring-MVC-4-Response-ViewResolver-ModelAndView-ResponseEntity-Response-Json-ing
	// https://velog.io/@wonizizi99/TIL-22.12.19-3Tier-controller-%EC%99%80RestController%EB%8F%99%EC%9E%91%EC%9B%90%EB%A6%AC-ResponseEntity-Httpstatus
	// https://m.blog.naver.com/nsqfrnidzb/222437153414 RestController����  ResponseEntity���� ��ȭ
	@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value, Model model,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception 
	{
		System.out.println("12321321321321332");
		Map<Object,Object> memberMap=new HashMap<Object,Object>();
		String val_list[]=null;
		HttpSession session=request.getSession();
		

		MembersVO memberVO=(MembersVO)session.getAttribute("memberInfo");
		String  member_idx=memberVO.getMembers_idx()+"";
		System.out.println("member_idx : "+member_idx);
		
		String temp;
		if(attribute.equals("tel"))
		{
			value=value.replaceAll(",","-");
			System.out.println("value:"+value);
			memberMap.put("members_phone_number",value);
		}
		else if(attribute.equals("email")){
			val_list=value.split(",");
			value = val_list[0]+"@"+val_list[1]; 
			memberMap.put("members_email",value);
		}
		else if(attribute.equals("address")){
			val_list=value.split(",");
			memberMap.put("members_address",val_list[0]);
			memberMap.put("members_detailed_address",val_list[1]);
		}
		else //password, nickname, 
		{
			memberMap.put(attribute,value);	
		}
		
		memberMap.put("members_idx", member_idx);

		

		memberVO=(MembersVO)myPageService.modifyMyInfo(memberMap);
		session.removeAttribute("user");
		System.out.println("member_idx: "+member_idx);
		session.setAttribute( "user",myPageService.givememember(  Integer.parseInt(member_idx)    )  );
		MembersVO RmemberVO = (MembersVO)session.getAttribute("user");
		System.out.println("new index is: "+ RmemberVO.getMembers_idx());
		session.setAttribute("memberInfo", RmemberVO);
		
		//return "mypage/myPageMain";
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/myOrderDetail" ,method = RequestMethod.GET)
	public String myOrderDetail(HttpSession httpsession, Model model, @RequestParam("orders_idx") int orders_idx )
	throws Exception
	{
		List<O_OD_P_C_S_M_vo> myorderdetail =  myPageService.getOrderDetail(orders_idx);
		httpsession.setAttribute("myorderdetail", myorderdetail );
		
		return "/mypage/myOrderDetail";
	}
	
	
	
	private static String CURR_IMAGE_REPO_PATH = "C:\\shopping\\file_reposi";
	
	@RequestMapping("/thumbnails")
	protected void thumbnails(@RequestParam("fileName") String fileName,
                            	@RequestParam("products_idx") String products_idx,
			                 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=CURR_IMAGE_REPO_PATH+"\\"+products_idx+"\\"+fileName;

		System.out.println("fileName:"+fileName);
		System.out.println("products_idx:" + products_idx);

		File image=new File(filePath);

		if (image.exists()) { 
			//https://yermi.tistory.com/entry/Library-%EC%9E%90%EB%B0%94Java%EC%97%90%EC%
			//84%9C-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EC%9D%B4%EB%AF%B8%EC%A7%80
			//-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EC%8D%B8%EB%84%A4%EC%9D%BC-%EB%9
			//D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC-Thumbnailator -->
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

	
}
