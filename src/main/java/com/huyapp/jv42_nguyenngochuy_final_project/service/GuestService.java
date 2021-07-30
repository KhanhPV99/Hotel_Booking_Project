/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.GuestEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.GuestRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class GuestService {
    @Autowired
    private GuestRepository guestRepository;

    // Find guest by Id
    public GuestEntity findById(int id) {
        Optional<GuestEntity> optionalGuest
                = guestRepository.findById(id);
        if (optionalGuest.isPresent()) {
            return optionalGuest.get();
        } else {
            return new GuestEntity();
        }
    }
    
    // Get all guests
    public List<GuestEntity> getGuests() {
        return (List<GuestEntity>) guestRepository.findAll();
    }
    
    // Get all guests by bookingDetail id
    public List<GuestEntity> getGuestsByBookingDetailId(int bookingId) {
        return (List<GuestEntity>) guestRepository.findGuestsByBookingDetailId(bookingId);
    }
    
    // Delete guest by Id
    public boolean deleteGuest(int id) {
        guestRepository.deleteById(id);
        return guestRepository.existsById(id);
    }
    
    // Save guest
    public void save(GuestEntity guest) {
        guestRepository.save(guest);
    }
}
