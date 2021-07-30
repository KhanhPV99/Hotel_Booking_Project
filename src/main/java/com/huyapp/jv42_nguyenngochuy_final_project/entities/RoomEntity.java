/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.entities;

import com.huyapp.jv42_nguyenngochuy_final_project.enums.RoomStatus;
import java.io.Serializable;
import java.time.LocalDate;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author PC
 */
@Entity
@Table(name = "room")
public class RoomEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "room_number", length = 100, nullable = false)
    @NotNull
    private String roomNumber;
    
    @Column(nullable = false)
    @NotNull
    @Enumerated(EnumType.STRING)
    private RoomStatus status;
    
    @Column(nullable = false)
    @NotNull
    @Min(value = 0)
    private double price;
    
    @Column(name = "number_of_bed", nullable = false)
    @NotNull
    @Min(value = 0)
    private int numberOfBed;
    
    @Column(name = "create_date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate createDate;
    
    @ManyToOne
    @JoinColumn(name = "roomtype_id")
    private RoomTypeEntity roomType;
    
    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<BookingDetailEntity> bookingDetails;
    
    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserCommentEntity> userCommentEntitys;

    @Transient
    private List<ImageEntity> images;
    
    @Transient
    private List<ConvenientEntity> convenients;
    
    @Transient
    private List<PromotionEntity> discounts;
    
    @Transient
    private List<BookingEntity> bookings;
    
    
    public RoomEntity() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public RoomStatus getStatus() {
        return status;
    }

    public void setStatus(RoomStatus status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumberOfBed() {
        return numberOfBed;
    }

    public void setNumberOfBed(int numberOfBed) {
        this.numberOfBed = numberOfBed;
    }

    public LocalDate getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDate createDate) {
        this.createDate = createDate;
    }

    public RoomTypeEntity getRoomType() {
        return roomType;
    }

    public void setRoomType(RoomTypeEntity roomType) {
        this.roomType = roomType;
    }

    public List<BookingDetailEntity> getBookingDetails() {
        return bookingDetails;
    }

    public void setBookingDetails(List<BookingDetailEntity> bookingDetails) {
        this.bookingDetails = bookingDetails;
    }

    
    public List<ImageEntity> getImages() {
        return images;
    }

    public void setImages(List<ImageEntity> images) {
        this.images = images;
    }

    public List<ConvenientEntity> getConvenients() {
        return convenients;
    }

    public void setConvenients(List<ConvenientEntity> convenients) {
        this.convenients = convenients;
    }

    public List<PromotionEntity> getDiscounts() {
        return discounts;
    }

    public void setDiscounts(List<PromotionEntity> discounts) {
        this.discounts = discounts;
    }

    public List<UserCommentEntity> getUserCommentEntitys() {
        return userCommentEntitys;
    }

    public void setUserCommentEntitys(List<UserCommentEntity> userCommentEntitys) {
        this.userCommentEntitys = userCommentEntitys;
    }

    public List<BookingEntity> getBookings() {
        return bookings;
    }

    public void setBookings(List<BookingEntity> bookings) {
        this.bookings = bookings;
    }
    
}
