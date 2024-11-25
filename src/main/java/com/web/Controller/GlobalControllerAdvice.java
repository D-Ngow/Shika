package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.web.DAO.categoriesDAO;
import com.web.DAO.usersDAO;
import com.web.Entity.Categories;
import com.web.Entity.Users;

@ControllerAdvice
public class GlobalControllerAdvice {
	@Autowired
	categoriesDAO cateDAO;
	@Autowired
	usersDAO usDAO;
    @ModelAttribute("listcate")
    public List<Categories> globalVariable() {
    	List<Categories> listcate = cateDAO.findAll();
        return listcate;
    }
    
    @ModelAttribute("userdt")
    public Users globaluser() {
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = usDAO.findByEmail(auth.getName());
		return user;
    }
    		
}


