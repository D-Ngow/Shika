package com.web.Controller;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.DAO.shippingAddressDAO;
import com.web.Entity.ShippingAddress;
import com.web.Entity.Users;
import com.web.Service.UserService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private UserService userService;
	@Autowired
	HttpServletRequest req;
	@Autowired
	shippingAddressDAO sad;
	
	
	@GetMapping()
	public String GetProfile(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userService.findByEmail(auth.getName());
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(user.getBirthday());
        List<ShippingAddress> listadress = sad.findAllByuser_userId(user.getUserId());
        model.addAttribute("listadr",listadress);
		model.addAttribute("user", user);
		model.addAttribute("birthday",formattedDate);
		return "profile";
	}
	
	@PostMapping("/edit")
	public String postMethodName(@ModelAttribute Users user, Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user1 = userService.findByEmail(auth.getName());
		Users us1 = user;
		us1.setUserId(Integer.parseInt(req.getParameter("id")));
		us1.setPassword(user1.getPassword());
		us1.setRole(user1.getRole());
		userService.saveUser(us1);
		model.addAttribute("user",user);
		return "redirect:/profile";
	}
	
	@PostMapping("/address")
	public String postAddress() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user1 = userService.findByEmail(auth.getName());
		ShippingAddress spa = new ShippingAddress();
		spa.setCity(req.getParameter("tp"));
		spa.setDistrict(req.getParameter("quan"));
		spa.setWard(req.getParameter("xa"));
		spa.setRoad(req.getParameter("duong"));
		spa.setUser(user1);
		sad.save(spa);
		return "redirect:/profile";
	}
	
	@PostMapping("/updateAddress")
	public String updateAddress() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userService.findByEmail(auth.getName());
		ShippingAddress spa = sad.findByIdAndUserId(Integer.parseInt(req.getParameter("addressId")), user.getUserId());
		spa.setCity(req.getParameter("tp"));
		spa.setDistrict(req.getParameter("quan"));
		spa.setWard(req.getParameter("xa"));
		spa.setRoad(req.getParameter("duong"));
		sad.save(spa);
		return "redirect:/profile";
	}
	
	@GetMapping("/deleteadr")
	public String getMethodName() {
		sad.deleteById(Integer.parseInt(req.getParameter("idadr")));
		return "redirect:/profile";
	}
	
	

}
