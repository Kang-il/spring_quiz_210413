package com.quiz.mybatis_quiz01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.mybatis_quiz01.bo.StoreBO;
import com.quiz.mybatis_quiz01.model.Store;



@RestController
public class MyBatisQuiz01Controller {
	
	@Autowired
	private StoreBO storeBO;
	

	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01_1(){
		List<Store> storeList=storeBO.getStoreList();
		return storeList;
	}
	
}
