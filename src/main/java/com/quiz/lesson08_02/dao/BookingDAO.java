package com.quiz.lesson08_02.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson08_02.model.Booking;

@Repository
public interface BookingDAO {
	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);
	
	public Booking selectBookingByNameAndPhoneNumber(
			@Param("name") String name
			,@Param("phoneNumber") String phoneNumber
			);
	
	public void insertBooking(Booking booking);
}
