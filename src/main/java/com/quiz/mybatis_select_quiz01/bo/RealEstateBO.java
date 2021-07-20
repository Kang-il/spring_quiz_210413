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
	
	//####### QUIZ01 SELECT
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstate(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(Integer rentPrice){
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaAndPrice(int area,int price){
		return realEstateDAO.selectRealEstateListByAreaAndPrice(area, price);
	}
	
	
	//####### QUIZ02 INSERT
	public int insertRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	public int inserRealEstateAsField(Integer realtorId,String address, int area, String type, int price, Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}

	
	//####### QUIZ03 UPDATE
	public int updateRealEstateById(Integer id, String type,int price) {
		return realEstateDAO.updateRealEstateById(id,type,price);
	}
	
	//####### QUIZ04 DELETE
	public int deleteRealEstateById(Integer id) {
		return realEstateDAO.deleteRealEstateById(id); 
	}
	
}
