package com.dag.productmanagementservice.controller;


import com.dag.productmanagementservice.dto.PaymentLinkRequestDto;
import com.dag.productmanagementservice.dto.PaymentLinkResponseDto;
import com.dag.productmanagementservice.models.PaymentStatus;
import com.dag.productmanagementservice.services.payment.PaymentService;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payments")
public class PaymentController {
    private PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    @PostMapping()
    public PaymentLinkResponseDto createPaymentLink(@RequestBody PaymentLinkRequestDto request) {

            String redirectUrl = this.paymentService.createPaymentLink(request);

            PaymentLinkResponseDto response = new PaymentLinkResponseDto();
            response.setUrl(redirectUrl);

        return response;
    }

    @GetMapping("/{id}")
    public PaymentStatus checkPaymentStatus(@PathVariable("id") String paymentGatewayPaymentId) {
        return this.paymentService.getPaymentStatus(paymentGatewayPaymentId);
    }

}
