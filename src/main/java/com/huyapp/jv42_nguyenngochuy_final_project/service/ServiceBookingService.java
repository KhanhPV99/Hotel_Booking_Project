/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceBookingEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.ServiceBookingRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class ServiceBookingService {
    @Autowired
    private ServiceBookingRepository serviceBookingRepository;

    // Find service by Id
    public ServiceBookingEntity findById(int id) {
        Optional<ServiceBookingEntity> optionalServiceBooking
                = serviceBookingRepository.findById(id);
        if (optionalServiceBooking.isPresent()) {
            return optionalServiceBooking.get();
        } else {
            return new ServiceBookingEntity();
        }
    }
    
    // Get all service bookings
    public List<ServiceBookingEntity> getServiceBookings() {
        return (List<ServiceBookingEntity>) serviceBookingRepository.findAll();
    }
    
    // Delete service by Id
    public boolean deleteServiceBooking(int id) {
        serviceBookingRepository.deleteByIdWithJPQL(id);
        return serviceBookingRepository.existsById(id);
    }
    
    // Save service
    public void save(ServiceBookingEntity serviceBooking) {
        serviceBookingRepository.save(serviceBooking);
    }
}
