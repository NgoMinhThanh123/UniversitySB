package com.nmt.universitysb.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class StudentSubjectDto {
    private int id;
    private Boolean status;
    private String studentId;
    private String subjectId;
}
