package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Major;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class creditPriceDto {
    private int schoolYear;
    private double price;
    private Major majorId;
}
