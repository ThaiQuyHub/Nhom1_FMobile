package com.group1.fmobile.service;

import com.group1.fmobile.domain.User;
import com.group1.fmobile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
/**
 * Lớp Service này cung cấp các phương thức để thao tác với đối tượng User
 * như tìm kiếm, lưu trữ, và kiểm tra sự tồn tại của email trong cơ sở dữ liệu.
 * @author [Ha Van Dat]
 */
@Service
public class UserService {
    private final UserRepository userRepository;
    /**
     * Hàm khởi tạo UserService.
     *
     * @param userRepository đối tượng UserRepository cung cấp phương thức thao tác với cơ sở dữ liệu
     */
    @Autowired
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    /**
     * Tìm kiếm người dùng bằng email.
     *
     * @param email email của người dùng cần tìm kiếm
     * @return đối tượng User tương ứng với email, hoặc null nếu không tìm thấy
     */
    @Transactional
    public User findByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
    /**
     * Lưu đối tượng User vào cơ sở dữ liệu.
     *
     * @param user đối tượng User cần lưu
     * @return đối tượng User sau khi được lưu vào cơ sở dữ liệu
     */
    @Transactional
    public User saveUser(User user) {
        return this.userRepository.save(user);
    }
    /**
     * Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu hay chưa.
     *
     * @param email email cần kiểm tra
     * @return true nếu email đã tồn tại, ngược lại trả về false
     */
    public boolean checkEmailExist(String email){
        return this.userRepository.existsByEmail(email);
    }
    /**
     * Lấy mật khẩu của người dùng dựa trên email.
     *
     * @param email email của người dùng cần lấy mật khẩu
     * @return chuỗi mật khẩu của người dùng
     * @throws UsernameNotFoundException nếu email không tồn tại trong cơ sở dữ liệu
     */
    public String getPasswordByEmail(String email) {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new UsernameNotFoundException("Email không tồn tại");
        }
        return user.getPassword();
    }


}
