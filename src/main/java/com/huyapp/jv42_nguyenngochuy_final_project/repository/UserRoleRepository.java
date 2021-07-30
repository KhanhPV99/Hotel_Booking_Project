/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserRoleEntity;
import java.util.List;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRoleEntity, Integer> {

    Set<UserRoleEntity> findByUsers_Email(String email);
    
    @Query("Select ur From UserRoleEntity ur join fetch ur.users user where user.id = ?1")
    List<UserRoleEntity> findUserRolesByUserId(int userId);
    
    @Query(value = "SELECT role FROM user_role ur" +
            " join user_role_relationship urr on ur.id = urr.role_id" + 
            " join user u on urr.user_id = u.id where u.id = ?1", nativeQuery = true)
    List<String> findRolesByUserId(int userId);
}
