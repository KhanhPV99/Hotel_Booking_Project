/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.controller;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.PromotionEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserCommentEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.UserRoleEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.PromotionStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.Role;
import com.huyapp.jv42_nguyenngochuy_final_project.enums.UserStatus;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.UserRepository;
import com.huyapp.jv42_nguyenngochuy_final_project.service.PromotionService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.RoomTypeService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserCommentService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserRoleService;
import com.huyapp.jv42_nguyenngochuy_final_project.service.UserService;
import com.huyapp.jv42_nguyenngochuy_final_project.utils.SecurityUtils;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Random;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@EnableScheduling
public class HomeController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private UserCommentService userCommentService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private JavaMailSender emailSender;

    @Autowired
    private PromotionService promotionService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    //    public String welcomePage(Model model) {
    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String welcomePage(Model model,
            HttpSession session) {
        model.addAttribute("roomTypes", roomTypeService.getRoomTypes());
        model.addAttribute("room", roomService.getRooms());
        model.addAttribute("promotion", promotionService.getPromotionValid(LocalDate.now()));
        
        List< String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_ADMIN")) {
//            model.addAttribute("message", "This is admin welcome page!");
            return "redirect:/admin/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_RECEPTIONIST")) {
//            model.addAttribute("message", "This is receptionist welcome page!");
            return "redirect:/receptionist/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_MANAGER")) {
//            model.addAttribute("message", "This is manager welcome page!");
            return "redirect:/manager/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_USER")) {
//            model.addAttribute("message", "This is manager welcome page!");
            model.addAttribute("role", "ROLE_USER");
            return "home";
        } else {
            return "home";
        }
    }

    @RequestMapping(value = {"/login"}, method = RequestMethod.GET)
    public String loginPage(Model model) {
        List<String> roles = SecurityUtils.getRolesOfUser();
        if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_ADMIN")) {
//            model.addAttribute("message", "This is admin welcome page!");
            return "redirect:/admin/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_RECEPTIONIST")) {
//            model.addAttribute("message", "This is receptionist welcome page!");
            return "redirect:/receptionist/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_MANAGER")) {
//            model.addAttribute("message", "This is manager welcome page!");
            return "redirect:/manager/index";
        } else if (!CollectionUtils.isEmpty(roles) && roles.contains("ROLE_USER")) {
//            model.addAttribute("message", "This is manager welcome page!");
            model.addAttribute("role", "ROLE_USER");
            return "home";
        } else {
            return "login";
        }
    }

// Register new account
    @RequestMapping("/register")
    public String registerPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Register Fail!!!");
        }
        return "register";
    }

    @RequestMapping(value = {"/user-add-new"}, method = RequestMethod.POST)
    public String userAddNew(Model model,
            @RequestParam(name = "email", required = true) String email,
            @RequestParam(name = "fullName", required = true) String fullName,
            @RequestParam(name = "password", required = true) String password) {

        boolean check = false;
        List<UserEntity> registeredUsers = userService.getUsers();
        for (int i = 0; i < registeredUsers.size(); i++) {
            if (registeredUsers.get(i).getEmail().equals(email)) {
                check = true;
                break;
            }
        }
        if (!check) {
            UserEntity user = new UserEntity();
            user.setEmail(email);
            user.setFullName(fullName);
            user.setCreateDate(LocalDate.now());
            user.setStatus(UserStatus.ACTIVE);
            // Default user role
            UserRoleEntity userRoleDefault = new UserRoleEntity();
            userRoleDefault.setRole(Role.ROLE_USER);
            userRoleService.save(userRoleDefault);
            Set<UserRoleEntity> userroles = new HashSet<>();
            userroles.add(userRoleDefault);
            user.setUserRoles(userroles);
            // Encrypt password
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String PasswordEncrypt = encoder.encode(password);
            user.setPassword(PasswordEncrypt);

            userService.save(user);
            return "login";
        } else {
            model.addAttribute("message", "Email exist in system! Please change another!");
            return "register";
        }
    }

// End of Register new account
// Forgot password function
    @RequestMapping("/forgot-password")
    public String forgorPasswordPage(Model model, @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Fail!!!");
        }
        return "forgot-password";
    }

    @RequestMapping("/email-verification")
    public String verifyEmail(Model model,
            @RequestParam(name = "email", required = true) String email) {

        boolean check = true;
        List<UserEntity> registeredUsers = userService.getUsers();
        for (int i = 0; i < registeredUsers.size(); i++) {
            if (registeredUsers.get(i).getEmail().equals(email)) {
                check = false;
                break;
            }
        }
        if (!check) {
            // Search user by email
            UserEntity user = userRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);

            // Generate Random Bounded String With Plain Java
            int leftLimit = 97; // letter 'a'
            int rightLimit = 122; // letter 'z'
            int targetStringLength = 10;
            Random random = new Random();
            StringBuilder buffer = new StringBuilder(targetStringLength);
            for (int i = 0; i < targetStringLength; i++) {
                int randomLimitedInt = leftLimit + (int) (random.nextFloat() * (rightLimit - leftLimit + 1));
                buffer.append((char) randomLimitedInt);
            }
            String generatedString = buffer.toString();
            // Create a Simple MailMessage.
            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Your Code Number to create a new password!");
            message.setText("Dear " + user.getFullName() + ",\n" + "Your Code Number is: " + generatedString + ". Please verify it to new password.\n"
                    + "Hope to see you again!");
            // Send Message!
            emailSender.send(message);
            model.addAttribute("id", user.getId());
            model.addAttribute("codeSent", generatedString);
            return "verify-code";
        } else {
            model.addAttribute("message", "Email do not exist in system! Please type email again!");
            return "forgot-password";
        }
    }

    @RequestMapping(value = {"/recover-password"}, method = RequestMethod.POST)
    public String passwordChange(Model model,
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "code", required = true) String code,
            @RequestParam(name = "codeSent", required = true) String codeSent) {

        if (code.equals(codeSent)) {
            model.addAttribute("id", id);
            return "recover-password";
        } else {
            model.addAttribute("message", "Your code is not exact! Please try another code!");
            model.addAttribute("id", id);
            model.addAttribute("codeSent", codeSent);
            return "verify-code";
        }
    }

    @RequestMapping(value = {"/create-new-password"}, method = RequestMethod.POST)
    public String changePassword(
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "password", required = true) String password) {

        UserEntity user = userService.findById(id);
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String newPasswordEncrypt = encoder.encode(password);
        user.setPassword(newPasswordEncrypt);
        userService.save(user);
        return "login";
    }

// End of Forgot password function
    @RequestMapping(value = {"/user-profile"}, method = RequestMethod.GET)
    public String viewUser(Model model,
            @RequestParam(name = "type", required = false) String type,
            @RequestParam(name = "message", required = false) String message) {
        String email = SecurityUtils.getEmail();
        List<String> roles = SecurityUtils.getRolesOfUser();
        UserEntity user = userRepository.findByEmailLikeAndStatusLike(email, UserStatus.ACTIVE);
        model.addAttribute("user", user);
        model.addAttribute("roles", roles);
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "user-profile";
    }

    @RequestMapping(value = {"/result-user"}, method = RequestMethod.POST)
    public String resultUser(
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "fullName", required = true) String fullName,
            @RequestParam(name = "phoneNumber", required = true) String phoneNumber,
            @RequestParam(name = "address", required = true) String address) {
        UserEntity user = userService.findById(id);
        user.setFullName(fullName);
        user.setPhoneNumber(phoneNumber);
        user.setAddress(address);
        userService.save(user);
        return "redirect:/user-profile";
    }

    @RequestMapping(value = {"/change-password"}, method = RequestMethod.POST)
    public String changePassword(
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "newPassword", required = true) String newPassword,
            @RequestParam(name = "confirmPassword", required = true) String confirmPassword) {
        if (newPassword.equals(confirmPassword)) {
            UserEntity user = userService.findById(id);
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            String newPasswordEncrypt = encoder.encode(newPassword);
            user.setPassword(newPasswordEncrypt);
            userService.save(user);
            return "login";
        } else {
            return "redirect:/user-profile?type=error&message=Change password fail! Password and Confirm password are not same!!!";
        }
    }

//    public static String encrytePassword(String password) {
//        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//        return encoder.encode(password);
//    }
    @RequestMapping(value = {"/comment-add"}, method = RequestMethod.POST)
    public String addNewComment(
            @RequestParam(name = "id", required = true) int id,
            @RequestParam(name = "content", required = true) String content) {
        UserEntity user = userService.findById(id);
        UserCommentEntity comment = new UserCommentEntity();
        List<UserCommentEntity> comments = user.getComments();
        comment.setContent(content);
        comment.setCreateDate(LocalDate.now());
        comment.setUser(user);
        userCommentService.save(comment);
        comments.add(comment);
        return "redirect:/user-profile";
    }

//    @RequestMapping("/403")
//    public String accessDenied(Model model) {
//        return "403Page";
//    }
//    @Scheduled(cron = "*/5 * * * * *", zone = "Asia/Saigon")
//    public void scheduleTaskUsingCronExpression() {
// 
//        List<PromotionEntity> promos = promotionService.getPromotions();
//        for (int i = 0; i < promos.size(); i ++) {
//            switch (promos.get(i).getStatus()) {
//                case UNAVAILABLE:
//                    if (LocalDate.now().isAfter(promos.get(i).getStartDate())) {
//                        promos.get(i).setStatus(PromotionStatus.AVAILABLE);
//                        promotionService.save(promos.get(i));
//                    }   break;
//                case AVAILABLE:
//                    if (LocalDate.now().isAfter(promos.get(i).getEndDate())) {
//                        promos.get(i).setStatus(PromotionStatus.EXPIRED);
//                        promotionService.save(promos.get(i));
//                    }   break;
//                default:
//                    ;
//                    break;
//            }
//        }
//        System.out.print(LocalDate.now());
//    }
}
