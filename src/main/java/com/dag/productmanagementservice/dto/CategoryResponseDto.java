package com.dag.productmanagementservice.dto;

import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoryResponseDto {
    String id;
    String name;
    String description;
    ProductResponseDto[] products;
}
