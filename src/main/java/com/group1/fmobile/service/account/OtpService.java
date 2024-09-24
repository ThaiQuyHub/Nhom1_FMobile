package com.group1.fmobile.service.account;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@Service
public class OtpService {

    private static final Logger logger = LoggerFactory.getLogger(OtpService.class);


    private final ConcurrentHashMap<String, CacheEntry> otpCache = new ConcurrentHashMap<>();
    private final ScheduledExecutorService scheduler = Executors.newSingleThreadScheduledExecutor();

    public OtpService() {
        scheduler.scheduleAtFixedRate(this::removeExpiredEntries, 1, 1, TimeUnit.MINUTES);
    }

    public String generateOTP() {
        return String.format("%06d", new Random().nextInt(999999));
    }

    public void saveOtp(String key, String otp, long expirationTimeInMillis) {
        otpCache.put(key, new CacheEntry(otp, System.currentTimeMillis() + expirationTimeInMillis));
    }

    public boolean verifyOtp(String key, String otp) {
        CacheEntry entry = otpCache.get(key);
        return entry != null && entry.otp.equals(otp) && System.currentTimeMillis() < entry.expirationTime;
    }

    public void removeOtp(String key) {
        otpCache.remove(key);
    }

    private void removeExpiredEntries() {
        long now = System.currentTimeMillis();
        otpCache.entrySet().removeIf(entry -> now > entry.getValue().expirationTime);
    }


    private static class CacheEntry {
        String otp;
        long expirationTime;

        CacheEntry(String otp, long expirationTime) {
            this.otp = otp;
            this.expirationTime = expirationTime;
        }
    }
}
