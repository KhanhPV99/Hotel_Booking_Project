/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.PromotionEntity;
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
public interface PromotionRepository extends
        CrudRepository<PromotionEntity, Integer> {

    @Query("Select pr From PromotionEntity pr join fetch pr.roomTypes roomtype where roomtype.id = ?1")
    List<PromotionEntity> findPromotionOfRoomType(int roomTypeId);

//    @Query("Select rt From RoomTypeEntity rt join fetch rt.promotions promotion where promotion.id = ?1")
//    List<RoomTypeEntity> findRoomTypeOfPromotion(int promotionId);
    @Query("Select pr From PromotionEntity pr join fetch pr.roomTypes roomtype where roomtype.id = ?1 and pr.startDate <= ?2 and pr.endDate >= ?2")
    List<PromotionEntity> findPromotionOfRoomTypeAvailable(int roomTypeId, LocalDate today);

    @Query(value = "SELECT * FROM promotion "
            + "where ?1 between start_date and end_date", nativeQuery = true)
    List<PromotionEntity> findPromotionValid(LocalDate localDate);

    @Query(value = "SELECT * FROM promotion p "
            + "join roomtype_promotion rp on p.id = rp.promotion_id "
            + "where rp.roomtype_id = ?1 and (?2 between p.start_date and end_date)", nativeQuery = true)
    List<PromotionEntity> findPromotionByRoomTypeId(int roomTypeId, LocalDate localDate);
}
