package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.model.StudentSubject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface SemesterService {
    List<Semester> findAll();
    Page<Semester> findAll(Pageable pageable);
    Optional<Semester> findById(String id);
    Page<Semester> findAllBySchoolYearContaining(String keyword, Pageable pageable);
    Semester save(Semester f);
    boolean deleteSemester(String id);
//    List<Semester> getSemesters(Map<String, String> params);
//    int countSemesters();
//    boolean addSemester(Semester m);
//    boolean updateSemester(Semester m);
//    Semester getSemesterById(String id);
    List<Semester> getSemesterByLecturerId(String lecturerId);
    List<Semester> getSemesterByStudentId(String studentId);
//    boolean deleteSemester(String id);
}