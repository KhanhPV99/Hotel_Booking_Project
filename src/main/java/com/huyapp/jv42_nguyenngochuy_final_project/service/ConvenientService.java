/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.ConvenientEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.ConvenientRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class ConvenientService {

    @Autowired
    private ConvenientRepository convenientRepository;


    // Find convenient by Id
    public ConvenientEntity findById(int id) {
        Optional<ConvenientEntity> optionalConvenient
                = convenientRepository.findById(id);
        if (optionalConvenient.isPresent()) {
            return optionalConvenient.get();
        } else {
            return new ConvenientEntity();
        }
    }

    // Get all convenients
    public List<ConvenientEntity> getConvenients() {
        return (List<ConvenientEntity>) convenientRepository.findAll();
    }

    // Search convenient by roomtypeId
    public List<ConvenientEntity> searchConvenients(int roomtypeId) {
        return convenientRepository.findConvenientsByRoomTypeId(roomtypeId);
    }

    // Delete convenient by Id
    public boolean deleteConvenient(int id) {
        convenientRepository.deleteById(id);
        return convenientRepository.existsById(id);
    }

    // Save convenient
    public void save(ConvenientEntity convenient) {
        convenientRepository.save(convenient);
    }

}
