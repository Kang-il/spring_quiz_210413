package com.quiz.lesson08_02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson08_02.dao.BookingDAO;
import com.quiz.lesson08_02.model.Booking;

@Service
public class BookingBO {
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList(){
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public Booking getBookingByNameAndPhoneNumber(String name,String phoneNumber) {
		return bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
	}
	
	public void insertBooking(Booking booking) {
		bookingDAO.insertBooking(booking);
	}
}
