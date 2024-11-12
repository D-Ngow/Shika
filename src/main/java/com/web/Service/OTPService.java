package com.web.Service;

import java.util.Random;
import org.springframework.stereotype.Service;

import com.web.Entity.OTPResult;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class OTPService {
    private final Map<String, Long> otpStore = new ConcurrentHashMap<>();
    private final int OTP_VALID_DURATION = 5 * 60 * 1000; // 5 phút (đơn vị: milliseconds)

    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        String otpStr = String.valueOf(otp);
        
        long expiryTime = System.currentTimeMillis() + OTP_VALID_DURATION;
        otpStore.put(otpStr, expiryTime); // Lưu OTP cùng thời gian hết hạn
        
        return otpStr;
    }

    public OTPResult validateOTP(String otp) {
        Long expiryTime = otpStore.get(otp);

        if (expiryTime == null) {
            return new OTPResult(false, "OTP không tồn tại.");
        }

        if (System.currentTimeMillis() > expiryTime) {
            otpStore.remove(otp); // Xóa OTP hết hạn
            return new OTPResult(false, "OTP đã hết hạn.");
        }

        otpStore.remove(otp); // OTP hợp lệ, xóa sau khi sử dụng
        return new OTPResult(true, "OTP hợp lệ.");
    }

    public void clearExpiredOTPs() {
        long currentTime = System.currentTimeMillis();
        otpStore.entrySet().removeIf(entry -> currentTime > entry.getValue());
    }
}

