/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserRoleEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.UserRoleRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class UserRoleService {
    @Autowired
    private UserRoleRepository userRoleRepository;

    // Find userrole by Id
    public UserRoleEntity findById(int id) {
        Optional<UserRoleEntity> optionalUserRole
                = userRoleRepository.findById(id);
        if (optionalUserRole.isPresent()) {
            return optionalUserRole.get();
        } else {
            return new UserRoleEntity();
        }
    }
    
    // Get all userroles
    public List<UserRoleEntity> getUserRoles() {
        return (List<UserRoleEntity>) userRoleRepository.findAll();
    }
    
    // Search userrole by userId
    public List<UserRoleEntity> searchUserRoles(int userId) {
        return userRoleRepository.findUserRolesByUserId(userId);
    }
    
    // Search roles by userId
    public List<String> searchRoles(int userId) {
        return userRoleRepository.findRolesByUserId(userId);
    }
    
    // Delete userrole by Id
    public boolean deleteUserRole(int id) {
        userRoleRepository.deleteById(id);
        return userRoleRepository.existsById(id);
    }
    
    // Save userrole
    public void save(UserRoleEntity userrole) {
        userRoleRepository.save(userrole);
    }
}
