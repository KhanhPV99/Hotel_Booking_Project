/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.BookingEntity;
import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface BookingRepository extends
        CrudRepository<BookingEntity, Integer> {

    @Query("Select b From BookingEntity b where b.bookingDate >= ?1 and b.bookingDate <= ?2")
    List<BookingEntity> findBookingsByBookingDate(LocalDate checkinDate, LocalDate checkoutDate);

}
