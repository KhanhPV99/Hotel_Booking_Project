/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomTypeEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.RoomTypeRepository;
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
public class RoomTypeService {
    @Autowired
    private RoomTypeRepository roomTypeRepository;

    // Find room type by Id
    public RoomTypeEntity findById(int id) {
        Optional<RoomTypeEntity> optionalRoomType
                = roomTypeRepository.findById(id);
        if (optionalRoomType.isPresent()) {
            return optionalRoomType.get();
        } else {
            return new RoomTypeEntity();
        }
    }
    
    // Search product by promotionId
    public RoomTypeEntity searchRoomTypeByRoomId(int roomId) {
        return roomTypeRepository.findRoomTypeByRoomId(roomId);
    }

    // Get all RoomTypes
    public List<RoomTypeEntity> getRoomTypes() {
        return (List<RoomTypeEntity>) roomTypeRepository.findAll();
    }
    
    // Search all roomtypes of promotion by productId
    public List<RoomTypeEntity> searchRoomTypes(int promotionId) {
        return roomTypeRepository.findRoomTypeOfPromotion(promotionId);
    }
    
    // Delete room type by Id
    public boolean deleteRoomType(int id) {
        roomTypeRepository.deleteById(id);
        return roomTypeRepository.existsById(id);
    }
    
    // Save room type
    public void save(RoomTypeEntity roomtype) {
        roomTypeRepository.save(roomtype);
    }
    
    
    public List<RoomTypeEntity> getRoomTypeImageById(int roomTypeId) {
        return (List<RoomTypeEntity>) roomTypeRepository.findRoomTypeImageById(roomTypeId);
    }
    
    public List<RoomTypeEntity> getRoomTypeConvenientById(int roomTypeId) {
        return (List<RoomTypeEntity>) roomTypeRepository.findRoomTypeConvenientById(roomTypeId);
    }
    
    public List<Double> getDiscountPromotionByDate(int roomTypeId, LocalDate dateCheckIn) {
        return (List<Double>) roomTypeRepository.findDiscountPromotionByDate(roomTypeId, dateCheckIn);
    }
}
