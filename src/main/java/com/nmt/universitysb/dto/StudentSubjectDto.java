package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.model.Subject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class StudentSubjectDto {
    private String studentId;
    private String subjectId;
}
