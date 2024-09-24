package com.group1.fmobile.service;


import com.group1.fmobile.repository.RoleRepository;
import com.group1.fmobile.domain.Role;
import com.group1.fmobile.domain.RoleType;
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
