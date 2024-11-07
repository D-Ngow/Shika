package com.web.DAO;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import com.web.Entity.ShippingAddress;

public interface shippingAddressDAO extends JpaRepository<ShippingAddress, Integer>{
	 List<ShippingAddress> findAllByuser_userId(int userId);
}
