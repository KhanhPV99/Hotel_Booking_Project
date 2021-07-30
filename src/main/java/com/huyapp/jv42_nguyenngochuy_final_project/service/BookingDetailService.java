/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingDetailEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.BookingDetailRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class BookingDetailService {
    @Autowired
    private BookingDetailRepository bookingDetailRepository;

    // Find booking detail by Id
    public BookingDetailEntity findById(int id) {
        Optional<BookingDetailEntity> optionalBookingDetail
                = bookingDetailRepository.findById(id);
        if (optionalBookingDetail.isPresent()) {
            return optionalBookingDetail.get();
        } else {
            return new BookingDetailEntity();
        }
    }
    
    // Get all booking details
    public List<BookingDetailEntity> getBookingDetails() {
        return (List<BookingDetailEntity>) bookingDetailRepository.findAll();
    }
    
    // Get all booking details by booking id
    public List<BookingDetailEntity> getBookingDetailsByBookingId(int bookingId) {
        return (List<BookingDetailEntity>) bookingDetailRepository.findBookingDetailsByBookingId(bookingId);
    }
    
    // Get all booking details by room id
    public List<BookingDetailEntity> getBookingDetailsByRoomId(int roomId) {
        return (List<BookingDetailEntity>) bookingDetailRepository.findBookingDetailsByRoomId(roomId);
    }
    
    // Delete booking detail by Id
    public boolean deleteBookingDetail(int id) {
        bookingDetailRepository.deleteById(id);
        return bookingDetailRepository.existsById(id);
    }
    
    // Save booking detail
    public void save(BookingDetailEntity bookingDetail) {
        bookingDetailRepository.save(bookingDetail);
    }
    
    // get booking detail history
    public List<BookingDetailEntity> findBookingDetailByBookingNumber(String bookingNumber) {
        return bookingDetailRepository.findBookingDetailByBookingNumber(bookingNumber);
    }
}
