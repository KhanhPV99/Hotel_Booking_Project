/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomTypeEntity;
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
public interface RoomTypeRepository extends
        CrudRepository<RoomTypeEntity, Integer> {

    @Query("Select rt From RoomTypeEntity rt join rt.rooms room where room.id = ?1")
    RoomTypeEntity findRoomTypeByRoomId(int roomId);

    @Query("Select rt From RoomTypeEntity rt join fetch rt.promotions promotion where promotion.id = ?1")
    List<RoomTypeEntity> findRoomTypeOfPromotion(int promotionId);

//    @Query(value = "Select rt.* from room_type rt"
//            + " join roomtype_promotion rtpr on rt.id = rtpr.roomtype_id"
//            + " join promotion pr on rtpr.promotion_id = pr.id"
//            + " where pr.id = ?1", nativeQuery = true)
//    List<RoomTypeEntity> findRoomTypeOfPromotion(int promotionId);
    @Query(value = "SELECT * FROM room_type rt "
            + "join image i on rt.id = i.roomtype_id "
            + "where rt.id = ?1", nativeQuery = true)
    List<RoomTypeEntity> findRoomTypeImageById(int roomTypeId);

    @Query(value = "SELECT * FROM convenient c "
            + "join roomtype_convenient rc on c.id = rc.convenient_id "
            + "join room_type rt on rt.id = rc.roomtype_id "
            + "where rc.roomtype_id = ?1", nativeQuery = true)
    List<RoomTypeEntity> findRoomTypeConvenientById(int roomTypeId);

    @Query(value = "SELECT p.discount FROM room_type rt "
            + "join roomtype_promotion rp on rt.id = roomtype_id "
            + "join promotion p on p.id = rp.promotion_id "
            + "where rt.id = ?1 and ('?2' between p.start_date and end_date)", nativeQuery = true)
    List<Double> findDiscountPromotionByDate(int roomTypeId, LocalDate dateCheckIn);

}
