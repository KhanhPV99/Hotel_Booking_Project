/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserCommentEntity;
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
public interface UserCommentRepository extends
        CrudRepository<UserCommentEntity, Integer> {
    @Transactional
    @Modifying
    @Query("DELETE UserCommentEntity uc WHERE uc.id = ?1")
    void deleteByIdWithJPQL(int id);
}
