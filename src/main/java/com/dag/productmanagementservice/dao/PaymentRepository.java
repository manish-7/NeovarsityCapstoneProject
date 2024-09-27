package com.dag.productmanagementservice.dao;


import com.dag.productmanagementservice.models.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {
    Payment save(Payment payment);

    Payment findByPaymentGatewayReferenceId(String paymentGatewayReferenceId);

    Payment findByOrderId(String paymentGatewayReferenceId);
}
