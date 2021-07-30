/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.ImageEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author PC
 */
@Repository
public interface ImageRepository extends
        CrudRepository<ImageEntity, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE ImageEntity i WHERE i.id = ?1")
    void deleteByIdWithJPQL(int id);
    
    @Query(value = "SELECT * FROM image i "
            + "inner join room_type rt on rt.id = i.roomtype_id "
            + "where rt.id = ?1", nativeQuery = true)
    List<ImageEntity> findImageRoomType(int roomTypeId);
}
