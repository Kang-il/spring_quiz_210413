package com.quiz.mybatis_quiz01.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.mybatis_quiz01.dao.StoreDAO;
import com.quiz.mybatis_quiz01.model.Store;

@Service
public class StoreBO {
	@Autowired
	private StoreDAO storeDAO;
	
	public List<Store> getStoreList(){
		return storeDAO.selectStoreList();
	}
	
}
