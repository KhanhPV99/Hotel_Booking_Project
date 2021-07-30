/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.ConvenientEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface ConvenientRepository extends
        CrudRepository<ConvenientEntity, Integer> {
    @Query("Select cv From ConvenientEntity cv join fetch cv.roomTypes roomType where roomType.id = ?1")
    List<ConvenientEntity> findConvenientsByRoomTypeId(int roomTypeId);
}
