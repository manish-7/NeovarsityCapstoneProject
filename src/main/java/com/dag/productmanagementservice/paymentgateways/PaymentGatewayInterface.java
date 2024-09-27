package com.dag.productmanagementservice.paymentgateways;

import com.dag.productmanagementservice.dto.PaymentLinkResponse;
import com.dag.productmanagementservice.models.PaymentStatus;

public interface PaymentGatewayInterface {

    PaymentLinkResponse createPaymentLink(
            Long amount,
            String userName,
            String userEmail,
            String userPhone,
            String orderId
    );

    PaymentStatus getPaymentStatus(
            String paymentId
    );
}
