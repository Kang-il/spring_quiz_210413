package com.quiz.lesson08_02;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson08_02.bo.BookingBO;
import com.quiz.lesson08_02.model.Booking;

@Controller
@RequestMapping("/lesson08/quiz02")
public class bookingController {
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/booking")
	public String bookingHome(
			Model model
			,@RequestParam(value="item" , required=false) String item) {
		Date date=new Date();
		
		
		if(item!=null) {
			
			if(item.equals("reserveList")) {
					
					getBookingList(model);
					model.addAttribute("item",item);
					
			}else if(item.equals("reservation")) {
				
					model.addAttribute("item", item);
					
			}
			
		}else if(item==null || item.equals("home")) {
			model.addAttribute("item",null);
			
		}
		
		
		model.addAttribute("currentTime", date.getTime());
		return "lesson08_02/00_bookingTemplate";
	}
	
	private void getBookingList(Model model){
		List<Booking> bookingList=bookingBO.getBookingList();
		model.addAttribute("subject", "예약 목록 보기");
		model.addAttribute("bookingList", bookingList);
	}
	
	@RequestMapping(path="/del_booking",method={RequestMethod.DELETE})//허용될 수 있는 METHOD를 중괄호로 묶어줄 수 있다.
	@ResponseBody
	public Map<String, Boolean> delReserveList(@RequestParam("booking_id")int bookingId){
		Map<String,Boolean> result=new HashMap<>();
		
		int checkSuccess=bookingBO.deleteBookingById(bookingId);
		
		if(checkSuccess==0) {
			result.put("result", false);
		}else {
			result.put("result", true);
		}
		
		return result;
	}
	
	@RequestMapping("/check_reservation")
	@ResponseBody
	public Booking checkReservation(@RequestParam("name") String name
									,@RequestParam("phoneNumber") String phoneNumber) {

		
		Booking booking=bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		
		
		return booking;
	}
	
	@RequestMapping("/register_reservation")
	@ResponseBody
	public Map<String,Boolean> registerReservation(@ModelAttribute Booking getBooking){
		Map<String,Boolean> result=new HashMap<>();
		
		//상태 기본값 입력
		getBooking.setState("대기중");
		
		Booking booking=bookingBO.getBookingByNameAndPhoneNumber(getBooking.getName(), getBooking.getPhoneNumber());
		
		if(booking!=null) {
			result.put("is_duplication", false);
		}else{
			result.put("is_duplication", true);
			bookingBO.insertBooking(getBooking);
		}
		return result;
	}
}
