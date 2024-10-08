package com.dag.productmanagementservice.validators;

import com.dag.productmanagementservice.validators.schema.Validator;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NonNullCheck implements Validator<String> {
    public boolean isValid(String value) {
        if (value == null || value.isEmpty()) {
            return false;
        }
        return true;
    }
}
