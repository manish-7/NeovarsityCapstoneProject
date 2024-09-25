package com.dag.productmanagementservice.services.product;

import com.dag.productmanagementservice.dto.ProductRequestDto;
import com.dag.productmanagementservice.dto.ProductResponseDto;

public interface ProductManagementService {
    ProductResponseDto getProductById(String id);

    ProductResponseDto createProduct(ProductRequestDto requestDto);

    ProductResponseDto[] getAllProducts();

    ProductResponseDto deleteproductById(String id);

    ProductResponseDto updateProductById(String id, ProductRequestDto requestDto);
}