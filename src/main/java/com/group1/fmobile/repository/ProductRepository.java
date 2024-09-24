@@ -0,0 +1,9 @@
package com.group1.fmobile.repository;

import com.group1.fmobile.domain.dto.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
}
