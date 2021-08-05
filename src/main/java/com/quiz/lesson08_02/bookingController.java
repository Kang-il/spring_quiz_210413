package com.quiz.lesson08_02;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson08_02.bo.BookingBO;
import com.quiz.lesson08_02.model.Booking;

@Controller
@RequestMapping("/lesson08")
public class bookingController {
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/quiz02/booking")
	public String bookingHome(
			Model model
			,@RequestParam(value="item" , required=false)String item) {
		Date date=new Date();
		
		if(item.equals("reserveList")) {
			getBookingList(model);
		}
		
		model.addAttribute("item",item);
		model.addAttribute("currentTime", date.getTime());
		return "lesson08_02/00_bookingTemplate";
	}
	
	private void getBookingList(Model model){
		List<Booking> bookingList=bookingBO.getBookingList();
		model.addAttribute("subject", "예약 목록 보기");
		model.addAttribute("bookingList", bookingList);
	}
	
	@RequestMapping("/quiz02/del_booking")
	@ResponseBody
	public Map<String, Boolean> delReserveList(@RequestParam("booking-id")int bookingId){
		Map<String,Boolean> result=new HashMap<>();
		
		int checkSuccess=bookingBO.deleteBookingById(bookingId);
		
		if(checkSuccess==0) {
			result.put("result", false);
		}else {
			result.put("result", true);
		}
		
		return result;
	}
	
}
