/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.CreditCardEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.CreditCardRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class CreditCardService {
    @Autowired
    private CreditCardRepository creditCardRepository;

    // Find creditcard by Id
    public CreditCardEntity findById(int id) {
        Optional<CreditCardEntity> optionalCreditCard
                = creditCardRepository.findById(id);
        if (optionalCreditCard.isPresent()) {
            return optionalCreditCard.get();
        } else {
            return new CreditCardEntity();
        }
    }
    
    // Get all creditcards
    public List<CreditCardEntity> getCreditCards() {
        return (List<CreditCardEntity>) creditCardRepository.findAll();
    }
    
    // Delete creditcard by Id
    public boolean deleteCreditCard(int id) {
        creditCardRepository.deleteById(id);
        return creditCardRepository.existsById(id);
    }
    
    // Save creditcard
    public void save(CreditCardEntity creditcard) {
        creditCardRepository.save(creditcard);
    }
    
    public CreditCardEntity creditCard(String cardNumber) {
        return creditCardRepository.creditCard(cardNumber);
    }
}
