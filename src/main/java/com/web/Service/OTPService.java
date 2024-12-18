package com.web.Service;

import java.util.Random;
import org.springframework.stereotype.Service;

import com.web.Entity.OTP;
import com.web.Entity.OTPResult;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class OTPService {
    private final Map<String, OTP> otpStore = new ConcurrentHashMap<>();
    private final int OTP_VALID_DURATION = 5 * 60 * 1000; // 5 phút (đơn vị: milliseconds)

    public String generateOTP(String email) {
        Random random = new Random();
        int otpNum = 100000 + random.nextInt(900000);
        String otpStr = String.valueOf(otpNum);
        
        long expiryTime = System.currentTimeMillis() + OTP_VALID_DURATION;
        OTP otp = new OTP(otpStr, expiryTime);
        otpStore.put(email, otp); // Lưu OTP cùng thời gian hết hạn
        System.out.println(otp.getOtp());
        return otpStr;
    }

    public OTPResult validateOTP(String otp, String email) {
        Long expiryTime = otpStore.get(email).getExpiryTime();

        if (expiryTime == null) {
            return new OTPResult(false, "OTP không tồn tại.");
        }
        else if(!otp.equals(otpStore.get(email).getOtp())) {
        	System.out.println(otp);
        	return new OTPResult(false, "OTP không chính xác");
        }

        if (System.currentTimeMillis() > expiryTime) {
            otpStore.remove(email); // Xóa OTP hết hạn
            return new OTPResult(false, "OTP đã hết hạn.");
        }
        
        otpStore.remove(email); // OTP hợp lệ, xóa sau khi sử dụng
        return new OTPResult(true, "Xác thực thành công.");
    }
}

