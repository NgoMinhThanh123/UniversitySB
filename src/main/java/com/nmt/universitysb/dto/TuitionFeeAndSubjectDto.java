package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.model.TuitionFee;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TuitionFeeAndSubjectDto {
    private String subjectId;
    private String name;
    private int credit;
    private double price;
}
