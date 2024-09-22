package com.dag.productmanagementservice.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ProductCategoryRequestDto {
    String name;
    String description;
    ProductRequestDto[] products;
}
