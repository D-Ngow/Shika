package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.payment;

public interface paymentDAO extends JpaRepository<payment, Integer>{

}
