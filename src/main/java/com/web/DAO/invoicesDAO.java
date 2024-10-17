package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Invoices;

public interface invoicesDAO extends JpaRepository<Invoices,Integer>{

}
