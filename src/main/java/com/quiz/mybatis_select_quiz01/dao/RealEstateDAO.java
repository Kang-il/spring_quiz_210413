package com.quiz.mybatis_select_quiz01.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.mybatis_select_quiz01.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstate(int id);
	public List<RealEstate> selectRealEstateListAsRentPrice(Integer RentPrice);
	public List<RealEstate> selectRealEstateListAsAreaAndPrice(@Param("area") int area , @Param("price")int price);
}
