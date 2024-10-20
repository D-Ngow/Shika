package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.ShippingAddress;

public interface shippingAddressDAO extends JpaRepository<ShippingAddress, Integer>{

}
