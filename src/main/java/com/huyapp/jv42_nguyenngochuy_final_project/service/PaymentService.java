/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.huyapp.jv42_nguyenngochuy_final_project.service;

import com.huyapp.jv42_nguyenngochuy_final_project.entities.PaymentEntity;
import com.huyapp.jv42_nguyenngochuy_final_project.repository.PaymentRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author PC
 */
@Service
public class PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    // Find payment by Id
    public PaymentEntity findById(int id) {
        Optional<PaymentEntity> optionalPayment
                = paymentRepository.findById(id);
        if (optionalPayment.isPresent()) {
            return optionalPayment.get();
        } else {
            return new PaymentEntity();
        }
    }
    
    // Get all payments
    public List<PaymentEntity> getPayments() {
        return (List<PaymentEntity>) paymentRepository.findAll();
    }
    
    // Get all payments by booking id
    public List<PaymentEntity> getPaymentsByBookingId(int bookingId) {
        return (List<PaymentEntity>) paymentRepository.findPaymentsByBookingId(bookingId);
    }
    
    // Delete payment by Id
    public boolean deletePayment(int id) {
        paymentRepository.deleteById(id);
        return paymentRepository.existsById(id);
    }
    
    // Save payment
    public void save(PaymentEntity payment) {
        paymentRepository.save(payment);
    }
}
