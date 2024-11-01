package com.web.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Invoices;
import com.web.Entity.Users;

public interface invoicesDAO extends JpaRepository<Invoices,Integer>{
	List<Invoices> findByUser(Users user);
}
