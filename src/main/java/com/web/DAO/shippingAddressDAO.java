package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.Entity.ShippingAddress;

public interface shippingAddressDAO extends JpaRepository<ShippingAddress, Integer>{
	 List<ShippingAddress> findAllByuser_userId(int userId);
	 @Query("SELECT s FROM ShippingAddress s WHERE s.addressId =:addressId AND s.user.userId =:userId")
	 ShippingAddress findByIdAndUserId(int addressId, int userId);
}
