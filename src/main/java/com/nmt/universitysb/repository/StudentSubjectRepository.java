package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.StudentSubject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentSubjectRepository extends JpaRepository<StudentSubject, Integer> {
    Optional<StudentSubject> findById(int id);
    Page<StudentSubject> findAllByStudentIdContaining(String keyword, Pageable pageable);
    StudentSubject save(StudentSubject f);
    void deleteById(int id);
    @Query("select a" +
            " from StudentSubject a where a.studentId.id = :studentId AND a.subjectId.id = :subjectId")
    Optional<StudentSubject> getStudentSubjectByStudentAndSubjectId(@Param("studentId") String studentId, @Param("subjectId") String subjectId);
}
