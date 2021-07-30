/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomEntity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface RoomRepository extends
        CrudRepository<RoomEntity, Integer> {

    @Query("Select r From RoomEntity r where r.status = 'AVAILABLE'")
    List<RoomEntity> findAvailableRooms();

//    @Query(value = "Select * from room r where status= 'AVAILABLE'", nativeQuery = true)
//    List<RoomEntity> findAvailableRooms();
    @Query(value = "SELECT * FROM room r"
            + " left join booking_detail bd on r.id = bd.room_id"
            + " left join booking b on bd.booking_id = b.id"
            + " where b.status != 'CHECKED_IN' or b.status is null and r.status = 'AVAILABLE'", nativeQuery = true)
    List<RoomEntity> findAllIdRoomsExceptCheckedIn();

    @Query(value = "SELECT * FROM room r\n"
            + " join room_type rt on rt.id = r.roomtype_id\n"
            + " join image i on rt.id = i.roomtype_id\n"
            + " where r.id not in\n"
            + " (SELECT r.id FROM room r\n"
            + " left join room_type rt on rt.id = r.roomtype_id\n"
            + " left join booking_detail bt on bt.room_id = r.id\n"
            + " left join booking b on b.id = bt.booking_id\n"
            + " where (b.status = \"CHECKED_OUT\" or b.status = \"CANCELED\") and b.checkin_date < ?2 and b.checkout_date > ?1)\n"
            + " and rt.id = ?3"
            + " group by r.id", nativeQuery = true)
    List<RoomEntity> findRoomSearch(LocalDate checkIn, LocalDate checkOut, int roomTypeId);

    @Query(value = "SELECT * FROM jv42_khanh_huy_project_final.booking_detail bd\n"
            + "join booking b on b.id = bd.booking_id\n"
            + "join room r on r.id = bd.room_id\n"
            + "join room_type rt on rt.id = r.roomtype_id\n"
            + "where b.booking_number = ?1", nativeQuery = true)
    RoomEntity findRoomByBookingNumber(String bookingNumber);

}
