<<<<<<< HEAD
package com.group1.fmobile.repository;

import com.group1.fmobile.domain.Role;
import com.group1.fmobile.domain.RoleType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByName(RoleType name);
    Role save(Role role);
}
=======
//package com.group1.fmobile.repository;
//
//import com.group1.fmobile.domain.Role;
//import com.group1.fmobile.domain.RoleType;
//import org.springframework.data.jpa.repository.JpaRepository;
//import org.springframework.stereotype.Repository;
//
//import java.util.Optional;
//@Repository
//public interface RoleRepository extends JpaRepository<Role, Long> {
//    Optional<Role> findByName(RoleType name);
//    Role save(Role role);
//}
>>>>>>> d358adf7717c9801ffd85c751589b68374d3a4a0
