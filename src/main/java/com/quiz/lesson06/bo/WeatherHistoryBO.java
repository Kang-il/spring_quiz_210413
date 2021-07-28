package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.WeatherHistoryDAO;
import com.quiz.lesson06.model.WeatherHistory;

@Service
public class WeatherHistoryBO {
	
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public List<WeatherHistory> getWeatherHistoryList(){
		return weatherHistoryDAO.selectWeatherHistoryList();
	}
	
	public void addWeatherHistory(WeatherHistory weatherHistory) {
		weatherHistoryDAO.insertWeatherHistory(weatherHistory);
	}
}
