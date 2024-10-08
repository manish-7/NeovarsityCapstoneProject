package com.dag.productmanagementservice.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "payments")
public class Payment  {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "amount")
    private Long amount;

    @Enumerated(EnumType.STRING)
    @Column(name="status")
    private PaymentStatus paymentStatus;

    @Column(name="user_id")
    private Long userId;

    @Column(name="order_id")
    private String orderId;

    @Column(name="payment_link")
    private String paymentLink;

    @Column(name="payment_ref")
    private String paymentGatewayReferenceId;

}
