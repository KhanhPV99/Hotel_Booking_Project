/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;


import com.huyapp.jv42_nguyenngochuy_final_project.entities.PromotionEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.PromotionRepository;
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
public class PromotionService {
    @Autowired
    private PromotionRepository promotionRepository;
    
    // Save promotion
    public void save(PromotionEntity promotion) {
        promotionRepository.save(promotion);
    }
    
    // Get all Promotions
    public List<PromotionEntity> getPromotions() {
        return (List<PromotionEntity>) promotionRepository.findAll();
    }
    
    // Find promotion by Id
    public PromotionEntity findById(int id) {
        Optional<PromotionEntity> optionalPromotion
                = promotionRepository.findById(id);
        if (optionalPromotion.isPresent()) {
            return optionalPromotion.get();
        } else {
            return new PromotionEntity();
        }
    }
    
    // Delete Promotion by Id
    public boolean deletePromotion(int id) {
        promotionRepository.deleteById(id);
        return promotionRepository.existsById(id);
    }
    
    // Search promotion by roomtypeId
//    @Transactional
    public List<PromotionEntity> searchPromotion(int roomtypeId) {
        return promotionRepository.findPromotionOfRoomType(roomtypeId);
    }
    
    // Search all roomtypes of promotion by productId
//    public List<RoomTypeEntity> searchRoomTypes(int promotionId) {
//        return promotionRepository.findRoomTypeOfPromotion(promotionId);
//    }
    
    
    public List<PromotionEntity> searchPromotionAvailable(int roomtypeId, LocalDate today) {
        return promotionRepository.findPromotionOfRoomTypeAvailable(roomtypeId, today);
    }
    
    
    public List<PromotionEntity> getPromotionValid(LocalDate localDate) {
        return promotionRepository.findPromotionValid(localDate);
    }
    
    public List<PromotionEntity> getPromotionByRoomTypeId(int roomTypeId, LocalDate localDate) {
        return promotionRepository.findPromotionByRoomTypeId(roomTypeId, localDate);
    }
}
