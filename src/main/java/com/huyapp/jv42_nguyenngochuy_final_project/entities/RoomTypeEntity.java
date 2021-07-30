/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.entities;

import com.huyapp.jv42_nguyenngochuy_final_project.enums.RoomStatus;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author PC
 */
@Entity
@Table(name="room_type")
public class RoomTypeEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(length = 100, nullable = false)
    @NotNull
    private String name;
    
    @Column(length = 1000)
    private String description;
    
    @Column(nullable = false)
    @Enumerated(EnumType.STRING)
    private RoomStatus status;
    
    @Column(name = "size_room", length = 100, nullable = false)
    @NotNull
    private String sizeRoom;
    
    @Column(nullable = false)
    @NotNull
    @Min(value = 0)
    private int guests;
    
    @Column(name = "create_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createDate;
    
    @OneToMany(mappedBy = "roomType", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private List<ImageEntity> images;
    
    @OneToMany(mappedBy = "roomType", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<RoomEntity> rooms;
    
//    @ManyToMany
//    @JoinTable(
//            name = "roomtype_promotion",
//            joinColumns = @JoinColumn(name = "roomtype_id"),
//            inverseJoinColumns = @JoinColumn(name = "promotion_id"))
//    private List<PromotionEntity> promotions;
    
    @ManyToMany(mappedBy = "roomTypes", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<PromotionEntity> promotions;
    
    @ManyToMany
    @JoinTable(
            name = "roomtype_convenient",
            joinColumns = @JoinColumn(name = "roomtype_id"),
            inverseJoinColumns = @JoinColumn(name = "convenient_id"))
    private List<ConvenientEntity> convenients;
    
    @Transient
    private MultipartFile[] imagesUpload;
    
//    @Transient
//    private List<Integer> promotionsId = new ArrayList<>();
    
    @Transient
    private List<Integer> convenientsId = new ArrayList<>();
    
    @Transient
    private boolean checked;

    public RoomTypeEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public RoomStatus getStatus() {
        return status;
    }

    public void setStatus(RoomStatus status) {
        this.status = status;
    }

    public String getSizeRoom() {
        return sizeRoom;
    }

    public void setSizeRoom(String sizeRoom) {
        this.sizeRoom = sizeRoom;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public List<RoomEntity> getRooms() {
        return rooms;
    }

    public void setRooms(List<RoomEntity> rooms) {
        this.rooms = rooms;
    }

    public List<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(List<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public List<ConvenientEntity> getConvenients() {
        return convenients;
    }

    public void setConvenients(List<ConvenientEntity> convenients) {
        this.convenients = convenients;
    }

    public MultipartFile[] getImagesUpload() {
        return imagesUpload;
    }

    public void setImagesUpload(MultipartFile[] imagesUpload) {
        this.imagesUpload = imagesUpload;
    }

//    public List<Integer> getPromotionsId() {
//        return promotionsId;
//    }
//
//    public void setPromotionsId(List<Integer> promotionsId) {
//        this.promotionsId = promotionsId;
//    }

    public List<Integer> getConvenientsId() {
        return convenientsId;
    }

    public void setConvenientsId(List<Integer> convenientsId) {
        this.convenientsId = convenientsId;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    
}
