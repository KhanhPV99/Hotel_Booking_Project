/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.UserRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    // Find user by Id
    public UserEntity findById(int id) {
        Optional<UserEntity> optionalUser
                = userRepository.findById(id);
        if (optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return new UserEntity();
        }
    }
    
    // Get all users
    public List<UserEntity> getUsers() {
        return (List<UserEntity>) userRepository.findAll();
    }
    
    // Delete user by Id
    public boolean deleteUser(int id) {
        userRepository.deleteById(id);
        return userRepository.existsById(id);
    }
    
    // Save user
    public void save(UserEntity user) {
        userRepository.save(user);
    }
}
