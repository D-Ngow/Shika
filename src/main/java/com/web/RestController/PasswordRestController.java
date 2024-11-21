package com.web.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.Entity.MailInfo;
import com.web.Entity.OTPResult;
import com.web.Entity.Users;
import com.web.Service.MailerService;
import com.web.Service.OTPService;
import com.web.Service.UserService;

@RestController
public class PasswordRestController {
	@Autowired
	UserService userService;
	@Autowired
	OTPService otpService;
	@Autowired
	MailerService mailer;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/changePass/rest/genOTP/{email}")
	public String changePass(@PathVariable String email) {
		Users user = userService.findByEmail(email);
		String otp = otpService.generateOTP(user.getEmail());
		MailInfo mail = new MailInfo();
		mail.setTo(user.getEmail());
		mail.setSubject("Yêu cầu thay đổi mật khẩu");
		mail.setBody("Kính gửi "+user.getName()+",\r\n"
				+ "\r\n"
				+ "Chúng tôi đã nhận được yêu cầu xác thực từ bạn.\r\n"
				+ "\r\n"
				+ "Mã OTP của bạn là: "+otp+"\r\n"
				+ "\r\n"
				+ "Vui lòng sử dụng mã này để hoàn tất quá trình xác thực.\r\n"
				+ "\r\n"
				+ "Lưu ý:\r\n"
				+ "\r\n"
				+ "Mã OTP có hiệu lực trong vòng 5 phút.\r\n"
				+ "Không chia sẻ mã này với bất kỳ ai để bảo vệ thông tin cá nhân của bạn.\r\n"
				+ "Nếu bạn không yêu cầu mã OTP này, vui lòng bỏ qua email này hoặc liên hệ với chúng tôi để được hỗ trợ.\r\n"
				+ "\r\n"
				+ "Trân trọng.");
		try {
			mailer.queue(mail);
//			System.out.println("Sended to: "+user.getEmail()+" with otp: "+otp);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return otp;
	}
	
	@PostMapping("/changePass/rest/submit/{otp}/{email}/{oldPass}/{newPass}")
	public OTPResult verifyOTP(@PathVariable String otp, @PathVariable String email, @PathVariable String oldPass, @PathVariable String newPass) {
		OTPResult otpRes = otpService.validateOTP(otp, email);
		if (otpRes.getSuccess()) {
			Users user = userService.findByEmail(email);
			if (passwordEncoder.matches(oldPass, user.getPassword())) {
				user.setPassword(passwordEncoder.encode(newPass));
				userService.saveUser(user);
			}
		}
		return otpRes;
	}
}
