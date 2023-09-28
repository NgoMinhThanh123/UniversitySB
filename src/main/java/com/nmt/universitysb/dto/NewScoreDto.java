package com.nmt.universitysb.dto;

import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.model.StudentSubject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class NewScoreDto {
    private Integer id;
    private Semester semesterId;
    private StudentSubjectDto studentSubjectId;
}
