package com.quiz.mybatis_select_quiz01;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.mybatis_select_quiz01.bo.RealEstateBO;
import com.quiz.mybatis_select_quiz01.model.RealEstate;

@RequestMapping("/lesson03")
@RestController
public class RealEstateController {
	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/quiz01/1") //id로 select 하기 (1개)
	public RealEstate quiz01(@RequestParam(value="id") int id ) {//@RequestParam -- request로 들어온 Anotation 
		//request / response
		return realEstateBO.getRealEstate(id); //jackson 라이브러리로 인해 json으로 리턴
	}
	
	@RequestMapping("/quiz01/2") //입력된 rentPrice보다 낮은 매물을 JSON형태로 출력하기
	public List<RealEstate> quiz02(
			@RequestParam(value="rentPrice") Integer rentPrice){//월세가 아닐수도 있으므로 null값을 가질 수 있는 Integer로 받는다
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	@RequestMapping("/quiz01/3") //복합조건 : 넓이와 가격을 받고 매물의 넓이가 입력된 넓이 이상인것 매물의 가격이 입력된 매매금보다 이하인 것 출력
	public List<RealEstate> quiz03(
			@RequestParam(value="area") int area
			,@RequestParam(value="price") int price){
		return realEstateBO.getRealEstateListByAreaAndPrice(area, price);
	}
	
	@RequestMapping("/quiz02/1")
	public String quiz02_1() {
		RealEstate realEstate=new RealEstate();
		
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		int row=realEstateBO.insertRealEstate(realEstate);
		
		return "입력성공 :" +row;
	}

	@RequestMapping("/quiz02/2")
	public String quiz02_2(@RequestParam(value="realtor_id",required=true)Integer realtorId) {
		int row = realEstateBO.inserRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력성공 :" + row;
	}
	
	

	
	
	
}
