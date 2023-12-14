package com.example.shoppingmall_project.model;

import java.util.List;

import com.example.shoppingmall_project.model.vo.InquiriesVO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface InquiriesDAO {
	@Select("SELECT *" + 
			"FROM inquiries " +   
			"WHERE inquiries_title = '구매후기'")
	
	
	
	List<InquiriesVO> selectAll();
	@Insert("insert into " + 
			"inquiries(inquiries_title, inquiries_category, inquiries_content, products_idx, members_idx) " +  
			"values(#{inquiries_title}, #{inquiries_category}, #{inquiries_content}, #{products_idx}, #{members_idx})")
	
	int insertInquiries(InquiriesVO input);
	
	

}
