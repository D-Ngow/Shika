package com.web.RestController;

import org.springframework.web.bind.annotation.RestController;

import com.web.DAO.invoiceDetailsDAO;
import com.web.DAO.invoicesDAO;
import com.web.Entity.InvoiceDetails;
import com.web.Entity.Invoices;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@RestController
public class ReportRestController {
	@Autowired
	invoicesDAO ivDAO;
	@Autowired
	invoiceDetailsDAO ivdDAO;
	
//	@GetMapping("/report/getBestSelling")
//	public List<InvoiceDetails> getBS() {
//		List<InvoiceDetails> listInvDt = ivdDAO.findBestSellingProductsReport();
//		return listInvDt;
//	}
//	
	@GetMapping("/report/getRevenue/{year}")
	public List<Double> getRevenue(@PathVariable int year) {
	    // Tạo danh sách lưu doanh thu của từng tháng
	    List<Double> monthlyRevenue = new ArrayList<>(Collections.nCopies(12, 0.0));

	    // Lấy tất cả hóa đơn
	    List<Invoices> listInv = ivDAO.findAll();

	    // Duyệt qua từng hóa đơn để tính tổng doanh thu
	    for (Invoices inv : listInv) {
	        Date createDate = inv.getCreateDate();
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(createDate);

	        // Lấy năm từ hóa đơn
	        int invoiceYear = cal.get(Calendar.YEAR);

	        // Kiểm tra nếu năm của hóa đơn trùng với năm yêu cầu
	        if (invoiceYear == year) {
	            // Lấy tháng từ 0-11 (Java Calendar tháng bắt đầu từ 0)
	            int month = cal.get(Calendar.MONTH);

	            // Cộng dồn doanh thu vào tháng tương ứng
	            monthlyRevenue.set(month, monthlyRevenue.get(month) + inv.getTotal());
	        }
	    }

	    return monthlyRevenue;
	}
	
	@GetMapping("/report/getDailyRevenue/{year}/{month}")
	public List<Double> getDailyRevenue(@PathVariable int year, @PathVariable int month) {
	    // Tạo danh sách lưu doanh thu cho từng ngày trong tháng (giả sử tối đa 31 ngày)
	    List<Double> dailyRevenue = new ArrayList<>(Collections.nCopies(31, 0.0));
	    
	    // Lấy tất cả hóa đơn
	    List<Invoices> listInv = ivDAO.findAll();
	    
	    for (Invoices inv : listInv) {
	        Date createDate = inv.getCreateDate();
	        Calendar cal = Calendar.getInstance();
	        cal.setTime(createDate);

	        // Kiểm tra nếu hóa đơn thuộc năm và tháng được truyền vào
	        int invoiceYear = cal.get(Calendar.YEAR);
	        int invoiceMonth = cal.get(Calendar.MONTH) + 1; // Calendar.MONTH từ 0-11
	        if (invoiceYear == year && invoiceMonth == month) {
	            int day = cal.get(Calendar.DAY_OF_MONTH); // Lấy ngày trong tháng (1-31)
	            // Cộng dồn doanh thu vào ngày tương ứng
	            dailyRevenue.set(day - 1, dailyRevenue.get(day - 1) + inv.getTotal());
	        }
	    }

	    return dailyRevenue;
	}

	
}
