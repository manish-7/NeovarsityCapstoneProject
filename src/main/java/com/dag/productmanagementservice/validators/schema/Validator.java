package com.dag.productmanagementservice.validators.schema;

public interface Validator<T> {
    boolean isValid(T value);
}
