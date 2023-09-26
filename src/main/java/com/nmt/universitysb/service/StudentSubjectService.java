package com.nmt.universitysb.service;

import com.nmt.universitysb.model.StudentSubject;
import com.nmt.universitysb.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface StudentSubjectService{
    List<StudentSubject> findAll();
    Page<StudentSubject> findAll(Pageable pageable);
    Optional<StudentSubject> findById(int id);
    Page<StudentSubject> findAllByStudentIdContaining(String keyword, Pageable pageable);
    StudentSubject save(StudentSubject f);

    boolean deleteStudentSubject(int id);
//    List<StudentSubject> getStudentSubjects(Map<String, String> params);
//    StudentSubject getStudentSubjectById(int id);
//    boolean addOrUpdateStudentSubject(StudentSubject s);
//    boolean deleteStudentSubject(int id);
//    StudentSubject getStudentSubjectByStudentAndSubjectId(String studentId, String subjectId);
//    int countStudentSubject();
}
