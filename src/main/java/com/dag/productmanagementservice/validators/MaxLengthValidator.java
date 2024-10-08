package com.dag.productmanagementservice.validators;

import com.dag.productmanagementservice.validators.schema.Validator;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MaxLengthValidator implements Validator<String> {
    private int maxLength;

    public MaxLengthValidator(int maxLength) {
        this.maxLength = maxLength;
    }

    public boolean isValid(String value) {
        if (value == null || value.isEmpty()) {
            return false;
        }
        return value.length() <= maxLength;
    }
}
