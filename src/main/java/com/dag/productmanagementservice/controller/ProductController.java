package com.dag.productmanagementservice.controller;

import com.dag.productmanagementservice.dto.ProductRequestDto;
import com.dag.productmanagementservice.dto.ProductResponseDto;
import com.dag.productmanagementservice.services.product.ProductManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductManagementService productManagementService;

    ProductController(ProductManagementService productManagementService) {
        this.productManagementService = productManagementService;
    }

    @GetMapping
    public ResponseEntity<ProductResponseDto[]> getAllProducts() {
        return ResponseEntity.ok(productManagementService.getAllProducts());
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProductResponseDto> getProductById(@PathVariable("id") String id) {
        return ResponseEntity.ok(productManagementService.getProductById(id));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<ProductResponseDto> deleteproductById(@PathVariable("id") String id) {
        return ResponseEntity.ok(
                productManagementService.deleteproductById(id));
    }

    @PostMapping
    public ResponseEntity<ProductResponseDto> createProduct(@RequestBody ProductRequestDto requestDto) {
        return ResponseEntity.ok(productManagementService.createProduct(requestDto));
    }

    @PutMapping("{id}")
    public ResponseEntity<ProductResponseDto> updateProductById(@PathVariable("id") String id,
                                                                @RequestBody ProductRequestDto requestDto) {
        return new ResponseEntity<>(productManagementService.updateProductById(id, requestDto), HttpStatus.OK);
    }

}