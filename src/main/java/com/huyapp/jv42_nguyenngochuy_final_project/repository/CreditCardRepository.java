/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.repository;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.CreditCardEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author PC
 */
@Repository
public interface CreditCardRepository extends
        CrudRepository<CreditCardEntity, Integer> {

    @Query(value = "SELECT * FROM credit_card\n "
            + "where card_number = ?1", nativeQuery = true)
    CreditCardEntity creditCard(String cardNumber);

}
