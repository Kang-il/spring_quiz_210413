package com.quiz.mybatis_jsp_quiz.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.mybatis_jsp_quiz.dao.SellerDAO;
import com.quiz.mybatis_jsp_quiz.model.Seller;


@Service
public class SellerBO {
	@Autowired
	private SellerDAO sellerDAO;
	
	//#### quiz01 seller INSERT
	public void insertSeller(String nickname,String profileImageUrl,double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	//#### quiz02 seller SELECT last seller
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	//#### quiz02 seller SELECT WHERE id
	public Seller getSellerById(int id) {
		return sellerDAO.selectSellerById(id);
	}
	
	
}
