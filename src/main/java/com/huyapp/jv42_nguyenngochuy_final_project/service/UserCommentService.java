/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserCommentEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.UserCommentRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class UserCommentService {
    @Autowired
    private UserCommentRepository userCommentRepository;

    // Find user comment by Id
    public UserCommentEntity findById(int id) {
        Optional<UserCommentEntity> optionalUserComment
                = userCommentRepository.findById(id);
        if (optionalUserComment.isPresent()) {
            return optionalUserComment.get();
        } else {
            return new UserCommentEntity();
        }
    }
    
    // Get all user comments
    public List<UserCommentEntity> getComments() {
        return (List<UserCommentEntity>) userCommentRepository.findAll();
    }
    
    // Delete user comment by Id
    public boolean deleteUserComment(int id) {
        userCommentRepository.deleteByIdWithJPQL(id);
        return userCommentRepository.existsById(id);
    }
    
    // Save user comment
    public void save(UserCommentEntity usercomment) {
        userCommentRepository.save(usercomment);
    }
}
