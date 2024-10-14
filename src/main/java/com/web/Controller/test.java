package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.web.DAO.usersDAO;
import com.web.Entity.users;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class test {
	@Autowired
	usersDAO dao;
	
	@GetMapping("/")
	public String getMethodName() {
		List<users> list = dao.findAll();
		for (users u : list) {
			System.out.println(u.getName());
		}
		return "index";
	}
	
	 
}
