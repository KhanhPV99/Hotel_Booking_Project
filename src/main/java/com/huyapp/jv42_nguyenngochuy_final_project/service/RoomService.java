/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.RoomRepository;
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
public class RoomService {
    @Autowired
    private RoomRepository roomRepository;

    // Find room by Id
    public RoomEntity findById(int id) {
        Optional<RoomEntity> optionalRoom
                = roomRepository.findById(id);
        if (optionalRoom.isPresent()) {
            return optionalRoom.get();
        } else {
            return new RoomEntity();
        }
    }
    
    // Get all Rooms
    public List<RoomEntity> getRooms() {
        return (List<RoomEntity>) roomRepository.findAll();
    }
    
    // Get all available rooms for booking
    public List<RoomEntity> getAvailableRooms() {
        return (List<RoomEntity>) roomRepository.findAvailableRooms();
    }
    
    // Get all available ID rooms except checked_in status for booking
    public List<RoomEntity> getAvailableRoomsExceptCheckedIn() {
        return (List<RoomEntity>) roomRepository.findAllIdRoomsExceptCheckedIn();
    }
    
    // Delete room by Id
    public boolean deleteRoom(int id) {
        roomRepository.deleteById(id);
        return roomRepository.existsById(id);
    }
    
    // Save room
    public void save(RoomEntity room) {
        roomRepository.save(room);
    }
    
    public List<RoomEntity> getRoomSearch(LocalDate checkIn, LocalDate checkOut,int roomTypeId) {
        return (List<RoomEntity>) roomRepository.findRoomSearch(checkIn, checkOut,roomTypeId);
    }
    
    public RoomEntity getRoomByBookingNumber(String bookingNumber) {
        return roomRepository.findRoomByBookingNumber(bookingNumber);
    }
}
