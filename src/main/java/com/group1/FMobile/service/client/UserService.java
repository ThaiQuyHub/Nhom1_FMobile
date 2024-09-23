package com.group1.fmobile.service.client;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;


public interface UserService {
//    public final UserRepository userRepository;
//    @Autowired
//    public UserService(UserRepository userRepository) {
//        this.userRepository = userRepository;
//    }
//
//    /**
//     * Hàm này xử lý logic đăng ký người dùng và lưu người dùng vào database.
//     * @param user thông tin người dùng nhập vào
//     * @return đối tượng User đã được lưu vào database
//     */
//    public User userInfo(User user) {
//        user.setCreationDate(LocalDate.now());
//        return userRepository.save(user);
//    }
    User findByEmail(String email);
}
