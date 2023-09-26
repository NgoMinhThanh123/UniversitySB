package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, String> {
    Optional<Subject> findById(String id);

    Page<Subject> findAllByNameContaining(String keyword, Pageable pageable);
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
