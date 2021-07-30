/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingDetailEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface BookingDetailRepository extends
        CrudRepository<BookingDetailEntity, Integer> {
    @Query(value = "Select * from booking_detail where booking_id = ?1", nativeQuery = true)
    List<BookingDetailEntity> findBookingDetailsByBookingId(int bookingId);
    
    @Query(value = "Select * from booking_detail where room_id = ?1", nativeQuery = true)
    List<BookingDetailEntity> findBookingDetailsByRoomId(int roomId);
    
    @Query(value = "SELECT * FROM jv42_khanh_huy_project_final.booking b\n"
            + "join booking_detail bd on bd.booking_id = b.id\n"
            + "join room r on r.id = bd.room_id\n"
            + "join room_type rt on rt.id = r.roomtype_id\n"
            + "join service_booking sb on sb.booking_detail_id = bd.id\n"
            + "join service s on s.id = sb.service_id\n"
            + "where b.booking_number = ?1", nativeQuery = true)
    List<BookingDetailEntity> findBookingDetailByBookingNumber(String bookingNumber);
}
