package com.group1.FMobile.service;

import com.group1.FMobile.domain.Role;
import com.group1.FMobile.domain.RoleType;
import com.group1.FMobile.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service
public class RoleService {
    private final RoleRepository roleRepository;

    @Autowired
    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Transactional
    public Role save(Role role) {
        return this.roleRepository.save(role);
    }

    @Transactional
    public Optional<Role> findByName(RoleType name) {
        return this.roleRepository.findByName(name);
    }
}
