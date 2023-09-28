package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Semester;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SemesterRepository extends JpaRepository<Semester, String> {
    Optional<Semester> findById(String id);
    Semester save(Semester f);
    void deleteById(String id);
    Page<Semester> findAllBySchoolYearContaining(String keyword, Pageable pageable);

    @Query(value ="SELECT DISTINCT semester.*\n" +
            "FROM semester\n" +
            "join score on score.semester_id = semester.id\n" +
            "join student_subject on score.student_subject_id = student_subject.id\n" +
            "join subject on student_subject.subject_id = subject.id\n" +
            "join lecturer_subject on lecturer_subject.subject_id = subject.id\n" +
            "join lecturer on lecturer_subject.lecturer_id = lecturer.id\n" +
            "where lecturer.id = :lecturerId",nativeQuery = true)
    List<Semester> getSemesterByLecturerId(@Param("lecturerId")String lecturerId);
    @Query(value ="SELECT DISTINCT semester.*\n" +
            "FROM semester\n" +
            "join score on score.semester_id = semester.id\n" +
            "join student_subject on score.student_subject_id = student_subject.id\n" +
            "join subject on student_subject.subject_id = subject.id\n" +
            "join student on student_subject.student_id = student.id\n"
            + "where student.id = :studentId",nativeQuery = true)
    List<Semester> getSemesterByStudentId( @Param("studentId") String studentId);
}
