package com.dag.productmanagementservice.validators;

import com.dag.productmanagementservice.validators.schema.Validator;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MinLengthValidator implements Validator<String> {
    private int minLength;

    public MinLengthValidator(int minLength) {
        this.minLength = minLength;
    }

    public boolean isValid(String value) {
        if (value == null || value.isEmpty()) {
            return false;
        }
        return value.length() >= minLength;
    }
}
