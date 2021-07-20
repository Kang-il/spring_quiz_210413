package com.quiz.mybatis_select_quiz01.dao;

import java.util.List;	

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.mybatis_select_quiz01.model.RealEstate;

@Repository
public interface RealEstateDAO {
	//QUIZ01 SELECT
	public RealEstate selectRealEstate(int id);
	public List<RealEstate> selectRealEstateListByRentPrice(Integer RentPrice);
	public List<RealEstate> selectRealEstateListByAreaAndPrice(@Param("area") int area , @Param("price")int price);
	
	
	//QUIZ02 INSERT
	public int insertRealEstate(RealEstate realEstate);
	public int insertRealEstateAsField(
			@Param("realtorId") Integer realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") Integer rentPrice
			);

	
	//QUIZ03 UPDATE
	public int updateRealEstateById(
			@Param("id") Integer id
			,@Param("type") String type
			,@Param("price") int price
			);
	
	//QUIZ04 DELETE
	public int deleteRealEstateById(Integer id);
	
}
