package com.dag.productmanagementservice.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignUpRequestDTO {
    @JsonProperty("eMail")
    private String eMail;
    @JsonProperty("password")
    private String password;
}
