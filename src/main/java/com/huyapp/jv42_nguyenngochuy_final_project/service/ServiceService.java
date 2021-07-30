/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.ServiceRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class ServiceService {
    @Autowired
    private ServiceRepository serviceRepository;

    // Find service by Id
    public ServiceEntity findById(int id) {
        Optional<ServiceEntity> optionalService
                = serviceRepository.findById(id);
        if (optionalService.isPresent()) {
            return optionalService.get();
        } else {
            return new ServiceEntity();
        }
    }
    
    // Get all services
    public List<ServiceEntity> getServices() {
        return (List<ServiceEntity>) serviceRepository.findAll();
    }
    
    // Get all available services for booking
    public List<ServiceEntity> getAvailableServices() {
        return (List<ServiceEntity>) serviceRepository.findAvailableServices();
    }
    
    // Delete service by Id
    public boolean deleteService(int id) {
        serviceRepository.deleteById(id);
        return serviceRepository.existsById(id);
    }
    
    // Save service
    public void save(ServiceEntity service) {
        serviceRepository.save(service);
    }
}
