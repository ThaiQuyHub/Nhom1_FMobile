//package com.group1.fmobile.service;
//
//import com.group1.fmobile.domain.User;
//import com.group1.fmobile.repository.UserRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Service
//public class UserService {
//    private final UserRepository userRepository;
//
//    @Autowired
//    public UserService(UserRepository userRepository) {
//        this.userRepository = userRepository;
//    }
//
//    @Transactional
//    public User findByEmail(String email) {
//        return this.userRepository.findByEmail(email);
//    }
//
//    @Transactional
//    public User saveUser(User user) {
//        return this.userRepository.save(user);
//    }
//    public boolean checkEmailExist(String email){
//        return this.userRepository.existsByEmail(email);
//    }
//}
