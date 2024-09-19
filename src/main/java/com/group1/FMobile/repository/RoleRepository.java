package com.group1.FMobile.repository;

import com.group1.FMobile.domain.Role;
import com.group1.FMobile.domain.RoleType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(RoleType name);
    Role save(Role role);
}
