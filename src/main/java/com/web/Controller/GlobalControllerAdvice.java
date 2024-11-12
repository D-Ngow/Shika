package com.web.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.web.DAO.categoriesDAO;
import com.web.Entity.Categories;

@ControllerAdvice
public class GlobalControllerAdvice {
	@Autowired
	categoriesDAO cateDAO;
    @ModelAttribute("listcate")
    public List<Categories> globalVariable() {
    	List<Categories> listcate = cateDAO.findAll();
        return listcate;
    }
}


