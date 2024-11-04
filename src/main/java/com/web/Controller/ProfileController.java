package com.web.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.web.Entity.Users;
import com.web.Service.UserService;

@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private UserService userService;

	@GetMapping("/{id}")
	public Users GetProfile(@PathVariable int id) {

		Users user = userService.findById(id);

		return user;
	}

	@PutMapping()
	public Users EditProfile (@RequestBody Users user) {

		Users editUser = userService.EditProfile(user);
		return editUser;
	}


}