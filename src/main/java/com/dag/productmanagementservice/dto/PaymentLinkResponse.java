package com.dag.productmanagementservice.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PaymentLinkResponse {
    private String shortUrl;
    private String referenceId;
}
