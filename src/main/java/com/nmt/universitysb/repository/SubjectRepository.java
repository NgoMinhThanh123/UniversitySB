package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.model.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, String> {
    List<Subject> findAll();
    Optional<Subject> findById(String id);

    long count();
    Subject save(Subject f);
    void deleteById(String id);
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
