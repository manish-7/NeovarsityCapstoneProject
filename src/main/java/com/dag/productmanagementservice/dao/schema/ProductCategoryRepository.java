package com.dag.productmanagementservice.dao.schema;

import com.dag.productmanagementservice.models.Category;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ProductCategoryRepository extends JpaRepository<Category, String> {
}
