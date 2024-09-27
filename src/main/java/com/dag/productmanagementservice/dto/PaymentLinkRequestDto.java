package com.dag.productmanagementservice.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentLinkRequestDto {
    private String orderId;
    private String username;
    private String phone;
    private String email;
    private String amount;
}
