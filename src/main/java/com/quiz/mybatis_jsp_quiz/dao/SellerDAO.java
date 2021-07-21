package com.quiz.mybatis_jsp_quiz.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.mybatis_jsp_quiz.model.Seller;

@Repository
public interface SellerDAO {
	
	//#### quiz01 seller INSERT
	public void insertSeller(	
			@Param("nickname") String nickname
			,@Param("profileImageUrl") String profileImageUrl
			,@Param("temperature")double temperature);
	
	//#### quiz02 seller SELECT last seller
	public Seller selectLastSeller();
	
	//#### quiz02 seller SELECT WHERE id
	public Seller selectSellerById(int id);
}
