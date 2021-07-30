/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.BookingRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class BookingService {
    @Autowired
    private BookingRepository bookingRepository;

    // Find booking by Id
    public BookingEntity findById(int id) {
        Optional<BookingEntity> optionalBooking
                = bookingRepository.findById(id);
        if (optionalBooking.isPresent()) {
            return optionalBooking.get();
        } else {
            return new BookingEntity();
        }
    }
    
    // Get all bookings
    public List<BookingEntity> getBookings() {
        return (List<BookingEntity>) bookingRepository.findAll();
    }
    
    // Search bookings by check-in and check-out date
    public List<BookingEntity> searchBookings(LocalDate checkinDate, LocalDate checkoutDate) {
        return (List<BookingEntity>) bookingRepository.findBookingsByBookingDate(checkinDate, checkoutDate);
    }
    
    // Delete booking by Id
    public boolean deleteBooking(int id) {
        bookingRepository.deleteById(id);
        return bookingRepository.existsById(id);
    }
    
    // Save booking
    public void save(BookingEntity booking) {
        bookingRepository.save(booking);
    }
}
