
package com.group1.fmobile.repository;


import com.group1.fmobile.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
//    User findByUsername(String username);
    User findByEmail(String email);
    User save(User user);
    boolean existsByEmail(String email);
}

