
package com.group1.fmobile.service;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
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


    public User getUserFromSession(HttpSession session){
        if(session.getAttribute("loggedInUser") == null){
            return null;
        }
        String email = session.getAttribute("loggedInUser").toString();
        User user = userRepository.findByEmail(email);
        return user;
    }
}

