package com.dag.productmanagementservice.services.payment;

import com.dag.productmanagementservice.dao.PaymentRepository;
import com.dag.productmanagementservice.dto.PaymentLinkRequestDto;
import com.dag.productmanagementservice.dto.PaymentLinkResponse;
import com.dag.productmanagementservice.models.Payment;
import com.dag.productmanagementservice.models.PaymentStatus;
import com.dag.productmanagementservice.paymentgateways.PaymentGatewayInterface;
import com.dag.productmanagementservice.paymentgateways.RazorpayPaymentGateway;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
    private final RazorpayPaymentGateway razorpayPaymentGateway;
    private PaymentRepository paymentRepository;

    public PaymentService(RazorpayPaymentGateway paymentGatewayFactory, PaymentRepository paymentRepository, RazorpayPaymentGateway razorpayPaymentGateway) {
        this.paymentRepository = paymentRepository;
        this.razorpayPaymentGateway = razorpayPaymentGateway;
    }

    public String createPaymentLink(PaymentLinkRequestDto paymentLinkRequestDto) {

        Long amount = Long.valueOf(paymentLinkRequestDto.getAmount());
        String userName = paymentLinkRequestDto.getUsername();
        String userMobile = paymentLinkRequestDto.getPhone();
        String userEmail = paymentLinkRequestDto.getEmail();
        String orderId=paymentLinkRequestDto.getOrderId();

        PaymentGatewayInterface paymentGateway = razorpayPaymentGateway;

        PaymentLinkResponse paymentLinkResponse = paymentGateway.createPaymentLink(
                amount, userName, userEmail, userMobile, orderId
        );

        com.dag.productmanagementservice.models.Payment payment = new Payment();
        payment.setPaymentLink(paymentLinkResponse.getShortUrl());
        payment.setPaymentGatewayReferenceId(paymentLinkResponse.getReferenceId());
        payment.setOrderId(orderId);
        payment.setPaymentStatus(PaymentStatus.PENDING);
        payment.setAmount(amount);

        paymentRepository.save(payment);

        return paymentLinkResponse.getShortUrl();

    }

    public PaymentStatus getPaymentStatus(String paymentGatewayPaymentId) {

        com.dag.productmanagementservice.models.Payment payment = paymentRepository.findByOrderId(paymentGatewayPaymentId);
        PaymentGatewayInterface paymentGateway = null;
        paymentGateway = razorpayPaymentGateway;

        PaymentStatus paymentStatus = paymentGateway.getPaymentStatus(payment.getPaymentGatewayReferenceId());;

        payment.setPaymentStatus(paymentStatus);

        paymentRepository.save(payment);

        return paymentStatus;
    }
}