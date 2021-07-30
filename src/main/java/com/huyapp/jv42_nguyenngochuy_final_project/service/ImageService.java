/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;


import com.huyapp.jv42_nguyenngochuy_final_project.entities.ImageEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.RoomTypeEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.entities.ServiceEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.ImageRepository;
import java.io.IOException;
import java.nio.file.DirectoryNotEmptyException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Service
public class ImageService {
    @Autowired
    private ImageRepository imageRepository;
    
    public ImageEntity findById(int id) {
        Optional<ImageEntity> optionalImage
                = imageRepository.findById(id);
        if (optionalImage.isPresent()) {
            return optionalImage.get();
        } else {
            return new ImageEntity();
        }
    }
    
    public List<ImageEntity> uploadImageToRoomType(MultipartFile[] files, HttpServletRequest request, RoomTypeEntity roomtype) {
        List<ImageEntity> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // get file name
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-image" + name;
                }
                
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setRoomType(roomtype);
                images.add(image);
                
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return images;
    }
    
    public List<ImageEntity> uploadImageToService(MultipartFile[] files, HttpServletRequest request, ServiceEntity service) {
        List<ImageEntity> images = new ArrayList<>();
        for (int i = 0; i < files.length; i++) {
            MultipartFile file = files[i];
            try {
                byte[] bytes = file.getBytes();
                
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");
                
                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // get file name
                String name = file.getOriginalFilename();
                
                if (name == null) {
                    name = "new-image" + name;
                }
                
                ImageEntity image = new ImageEntity();
                image.setName(name);
                image.setService(service);
                images.add(image);
                
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return images;
    }
    
    public ImageEntity save(ImageEntity image) {
        return imageRepository.save(image);
    }
    
    // Delete Image by ID
//    public boolean deleteImage(int id) {
//        imageRepository.deleteById(id);
//        return imageRepository.existsById(id);
//    }
    public boolean deleteImage(int id, HttpServletRequest request) {
        String imageName = findById(id).getName();
        imageRepository.deleteByIdWithJPQL(id);
        ServletContext context = request.getServletContext();
        String pathUrl = context.getRealPath("/images");
        int index = pathUrl.indexOf("target");
        String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources-management\\images\\";
        Path path = Paths.get(pathFolder + imageName);
        try
        {
            Files.deleteIfExists(path);
        }
        catch(NoSuchFileException e)
        {
            System.out.println("No such file/directory exists");
        }
        catch(DirectoryNotEmptyException e)
        {
            System.out.println("Directory is not empty.");
        }
        catch(IOException e)
        {
            System.out.println("Invalid permissions.");
        }
        System.out.println("Deletion successful.");
        return imageRepository.existsById(id);
    }
    
    
    public List<ImageEntity> getImages() {
        return (List<ImageEntity>) imageRepository.findAll();
    }
    
    public List<ImageEntity> getImageRoomType(int roomTypeId) {
        return (List<ImageEntity>) imageRepository.findImageRoomType(roomTypeId);
    }
}
