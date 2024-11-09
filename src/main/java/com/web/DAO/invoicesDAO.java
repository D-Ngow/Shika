package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.web.Entity.Cart;
import com.web.Entity.Invoices;
import com.web.Entity.Users;

public interface invoicesDAO extends JpaRepository<Invoices,Integer>{
	@Query("SELECT i FROM Invoices i WHERE i.user.userId =:id")
    List<Invoices> findByuserid(int id);

}
