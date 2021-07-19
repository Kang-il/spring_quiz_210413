package com.quiz.mybatis_select_quiz01.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.mybatis_select_quiz01.dao.RealEstateDAO;
import com.quiz.mybatis_select_quiz01.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(Integer rentPrice){
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area,int price){
		return realEstateDAO.selectRealEstateListByAreaAndPrice(area, price);
	}
}
