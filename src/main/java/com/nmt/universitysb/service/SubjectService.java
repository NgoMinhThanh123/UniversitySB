package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Subject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface SubjectService {
    List<Subject> findAll();
    Page<Subject> findAll(Pageable pageable);
    Optional<Subject> findById(String id);

    Page<Subject> findAllByNameContaining(String keyword, Pageable pageable);
    Subject save(Subject f);

    boolean deleteSubject(String id);
//    List<Subject> getSubjects(Map<String, String> params);
//    int countSubjects();
//    boolean addSubject(Subject c);
//    boolean updateSubject(Subject c);
//    Subject getSubjectById(String id);
//    List<Subject> getSubjectByLecturerId(String lecturerId);
//    List<Subject> getSubjectByStudentId(String studentId);
//    List<Subject> getSubjectByStudentAndSemesterId(String studentId, String semesterId);
//    boolean deleteSubject(String id);
}
