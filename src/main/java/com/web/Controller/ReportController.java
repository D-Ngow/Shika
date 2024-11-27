package com.web.Controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.DAO.invoicesDAO;
import com.web.Entity.Invoices;


@Controller
public class ReportController {
	@Autowired
	invoicesDAO ivDAO;
	
	@GetMapping("/report")
	public String report(Model model) {
	    List<Invoices> listInv = ivDAO.findAll();
	    Set<Integer> yearSet = new HashSet<>(); // Sử dụng Set để tránh trùng lặp

	    for (Invoices inv : listInv) {
	        Date createDate = inv.getCreateDate();
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(createDate);

	        int invoiceYear = cal.get(Calendar.YEAR);
	        yearSet.add(invoiceYear); // Set tự động loại bỏ các giá trị trùng
	    }

	    // Chuyển từ Set sang List (nếu cần)
	    List<Integer> yearList = new ArrayList<>(yearSet);
	    Collections.sort(yearList); // Sắp xếp các năm nếu cần

	    model.addAttribute("listYear", yearList); // Truyền vào model
	    return "report";
	}
	
}
