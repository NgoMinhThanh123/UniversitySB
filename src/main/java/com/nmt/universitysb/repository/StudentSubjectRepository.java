package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.StudentSubject;
import com.nmt.universitysb.model.Subject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentSubjectRepository extends JpaRepository<StudentSubject, Integer> {
    Optional<StudentSubject> findById(int id);
    Page<StudentSubject> findAllByStudentIdContaining(String keyword, Pageable pageable);
    StudentSubject save(StudentSubject f);
    void deleteById(int id);
//    List<StudentSubject> getStudentSubjects(Map<String, String> params);
//    StudentSubject getStudentSubjectById(int id);
//    boolean addOrUpdateStudentSubject(StudentSubject st);
//    boolean deleteStudentSubject(int id);
//    StudentSubject getStudentSubjectByStudentAndSubjectId(String studentId, String subjectId);
//    int countStudentSubject();
}
