package com.dag.productmanagementservice.dto;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ValidateTokenRequestDTO {
    private String token;
    private Long userId;
}
