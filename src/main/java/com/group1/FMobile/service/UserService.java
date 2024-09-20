package com.group1.fmobile.service;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }


    public User getUserById(Long id) {
        return userRepository.findById(id).orElse(null);
    }


    @Transactional
    public User findByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    @Transactional
    public User saveUser(User user) {
        return this.userRepository.save(user);
    }
    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }
    public String getPasswordByEmail(String email) {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new UsernameNotFoundException("Email không tồn tại");
        }
        return user.getPassword();
    }

    public boolean isAdmin(){
        return true;
    }

    public User updateUserProfile(String email, String fullName, String phone, String address) {
        User user = userRepository.findByEmail(email);
        if (user != null) {
            user.setFullName(fullName);
            user.setPhone(phone);
            user.setAddress(address);
            return userRepository.save(user);
        }
        return null;
    }

    public User getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }



    public Optional<User> findByFullName(String fullName) {
        return userRepository.findByFullName(fullName);
    }
}
