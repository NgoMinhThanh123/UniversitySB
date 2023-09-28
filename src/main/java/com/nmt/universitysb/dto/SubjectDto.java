package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Faculty;
import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.model.Subject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class SubjectDto {
    private String id;
    private String name;
    private int credit;
    private Faculty facultyId;
}
