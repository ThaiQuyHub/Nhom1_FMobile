package com.group1.FMobile.service;

import com.group1.FMobile.domain.Role;
import com.group1.FMobile.domain.RoleType;
import com.group1.FMobile.domain.User;
import com.group1.FMobile.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;

@Service
public class UserService {
    private final UserRepository userRepository;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User saveUser(User user) {
        user.setRoles(new HashSet<>(List.of(new Role(1, RoleType.USER))));
        user.setCreationDate(LocalDate.now());
        user.setUpdatedAt(LocalDateTime.now());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        return this.userRepository.save(user);
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<Object[]> findTotalPaymentsByUser() {
        return userRepository.findTotalPaymentsByUser();
    }

    // Lấy tổng tiền của người dùng kèm tìm kiếm theo tên đầy đủ
    public List<Object[]> findTotalPaymentsByUserWithSearch(String search) {
        return userRepository.findTotalPaymentsByUserWithSearch(search);
    }

    public Page<User> getAllPage(String search, Integer pageNo) {
        PageRequest pageRequest = PageRequest.of(pageNo - 1, 5);

        if (search != null && !search.isEmpty()) {
            return userRepository.searchUsersByFullName(search, pageRequest);
        } else {
            return userRepository.findAll(pageRequest);
        }
    }

    public Long countTotalUsers() {
        return this.userRepository.countTotalUsers();
    }

    @Transactional
    public User findByEmail(String email) {
        return this.userRepository.findByEmail(email);
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

    public Boolean existsByUserEmail(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserById(Long id) {
        return this.userRepository.getById(id);
    }
}
