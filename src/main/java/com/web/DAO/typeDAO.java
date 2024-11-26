package com.web.DAO;

import org.springframework.data.jpa.repository.JpaRepository;

import com.web.Entity.Type;
import java.util.List;


public interface typeDAO extends JpaRepository<Type, Integer>{
	Type findBySize(int size);
}
