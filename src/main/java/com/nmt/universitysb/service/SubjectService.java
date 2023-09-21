package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.model.Subject;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface SubjectService {
    List<Subject> findAll();
    Optional<Subject> findById(String id);

    long count();
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
