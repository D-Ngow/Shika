package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Payment;

public interface paymentDAO extends JpaRepository<Payment, Integer>{

}
