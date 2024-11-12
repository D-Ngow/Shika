package com.web.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.Entity.MailInfo;
import com.web.Entity.Users;
import com.web.Service.MailerService;
import com.web.Service.OTPService;
import com.web.Service.UserService;

public class PasswordRestController {
	@Autowired
	UserService userService;
	@Autowired
	OTPService otp;
	@Autowired
	MailerService mailer;
	
	@GetMapping("/changePass/submit")
	public String changePass() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users user = userService.findByEmail(auth.getName());
		MailInfo mail = new MailInfo();
		mail.setTo(user.getEmail());
		mail.setSubject("Yêu cầu thay đổi mật khẩu");
		mail.setBody("Kính gửi "+user.getName()+",\r\n"
				+ "\r\n"
				+ "Chúng tôi đã nhận được yêu cầu xác thực từ bạn.\r\n"
				+ "\r\n"
				+ "Mã OTP của bạn là: "+otp.generateOTP()+"\r\n"
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
		mailer.queue(mail);
		return "redirect:/changePass";
	}
}
