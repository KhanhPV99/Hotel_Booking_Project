/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.controller;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserRoleEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.Gender;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.UserStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserCommentService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserRoleService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserService;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserRoleService userRoleService;
    
    @Autowired
    private UserCommentService userCommentService;
    
    @RequestMapping("/index")
    public String viewHome(Model model) {

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.toString();
        if (principal instanceof UserDetails) {
            username = ((UserDetails) principal).getUsername();
        }

        model.addAttribute("username", username);
        return "admin/index";
    }
    
// User controllers
    @RequestMapping("/user-add")
    public String addUser(Model model) {
        model.addAttribute("user", new UserEntity());
        model.addAttribute("status", UserStatus.values());
        model.addAttribute("userroles", userRoleService.getUserRoles());
        model.addAttribute("gender", Gender.values());
        model.addAttribute("action", "add");

        return "admin/user-add";
    }
    
    @RequestMapping(value = "/result-user", method = RequestMethod.POST)
    public String resultuser(Model model,
            @Valid  @ModelAttribute("user") UserEntity user) {
        
        // Save list of userroles
        Set<UserRoleEntity> userroles = new HashSet<>();
        for(int i = 0; i < user.getUserrolesId().size(); i++) {
            userroles.add(userRoleService.findById(user.getUserrolesId().get(i)));
        }
        user.setUserRoles(userroles);
        // Encrypt password
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String PasswordEncrypt = encoder.encode(user.getPassword());
        user.setPassword(PasswordEncrypt);
        userService.save(user);
        return "redirect:/admin/view-users";
    }
    
    @RequestMapping("/user-edit/{userId}")
    public String editUser(Model model,
            @PathVariable("userId") int userId) {
        model.addAttribute("user", userService.findById(userId));
        model.addAttribute("status", UserStatus.values());
        List<UserRoleEntity> userroleOfUsers = userRoleService.searchUserRoles(userId);
        List<UserRoleEntity> userroles = userRoleService.getUserRoles();
        for(int i = 0; i < userroles.size(); i++) {
            for(int j = 0; j < userroleOfUsers.size(); j++) {
                if(userroles.get(i).getRole().equals(userroleOfUsers.get(j).getRole())) {
                    userroles.get(i).setChecked(true);
                    break;
                } else
                    userroles.get(i).setChecked(false);
            }
        }
        model.addAttribute("userroles", userroles);
        return "admin/user-edit";
    }
    
    @RequestMapping(value = "/update-user", method = RequestMethod.POST)
    public String updateUser(Model model,
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "status", required = false) UserStatus status,
            @RequestParam(name = "userrolesId", required = false) List<Integer> userrolesId) {
        
        UserEntity user = userService.findById(id);
        // Save list of userroles
        Set<UserRoleEntity> userroles = new HashSet<>();
        for(int i = 0; i < userrolesId.size(); i++) {
            userroles.add(userRoleService.findById(userrolesId.get(i)));
        }
        user.setUserRoles(userroles);
        user.setStatus(status);
        userService.save(user);
        return "redirect:/admin/view-users";
    }
    
    @RequestMapping(value = {"/view-users"}, method = RequestMethod.GET)
    public String viewUsers(Model model,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
        List<UserEntity> users = userService.getUsers();
        for (int i = 0; i < users.size(); i++) {
            users.get(i).setRoles(userRoleService.searchRoles(users.get(i).getId()));
        }
        model.addAttribute("users", users);
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "admin/view-users";

    }
    
    @RequestMapping("/user-delete/{userId}")
    public String deleteUser(Model model,
            @PathVariable("userId") int userId) {
        if (userService.deleteUser(userId)) {
            return "redirect:/admin/view-users?type=error&message=Delete User Id: " + userId + " Fail!!!";
        } else {
            return "redirect:/admin/view-users?type=success&message=Delete User Id: " + userId + " success!!!";
        }
    }
    
// End of User controllers
    
// User Comment controllers
    @RequestMapping(value = {"/view-comments"}, method = RequestMethod.GET)
    public String viewCommments(Model model,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
        model.addAttribute("comments", userCommentService.getComments());
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "admin/view-comments";
    }
    
    @RequestMapping("/comment-delete/{commentId}")
    public String deleteComment(Model model,
            @PathVariable("commentId") int commentId) {
        if (userCommentService.deleteUserComment(commentId)) {
            return "redirect:/admin/view-comments?type=error&message=Delete Comment Id: " + commentId + " Fail!!!";
        } else {
            return "redirect:/admin/view-comments?type=success&message=Delete Comment Id: " + commentId + " success!!!";
        }
    }

// End of User Comment controllers    
}
