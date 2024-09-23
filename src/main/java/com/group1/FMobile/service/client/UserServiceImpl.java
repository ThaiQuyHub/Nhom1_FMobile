package com.group1.fmobile.service.client;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;
    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public User findByEmail(String email) {
        return userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found with email: " + email));
    }
//@Override
//public User findByEmail(String email) {
//    Optional<User> userOptional = userRepository.findByEmail(email);
//    if (userOptional.isPresent()) {
//        User user = userOptional.get();
//        if (user.getFullName() == null || user.getFullName().isEmpty()) {
//            throw new RuntimeException("FullName của người dùng trống hoặc null");
//        }
//        return user;
//    } else {
//        throw new RuntimeException("Không tìm thấy người dùng với email: " + email);
//    }
//}
}
