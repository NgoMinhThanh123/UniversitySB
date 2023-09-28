package com.nmt.universitysb.repository;
import com.nmt.universitysb.dto.SubjectDto;
import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SubjectRepository extends JpaRepository<Subject, String> {
    Optional<Subject> findById(String id);

    Page<Subject> findAllByNameContaining(String keyword, Pageable pageable);
    Subject save(Subject f);
    void deleteById(String id);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) " +
            "from Subject a " +
            "join LecturerSubject ls on a.id = ls.subjectId " +
            "join Lecturer l on l.id = ls.lecturerId " +
            "where l.id = :lecturerId")
    List<SubjectDto> getSubjectByLecturerId(@Param("lecturerId") String lecturerId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) " +
            "from Subject a " +
            "join StudentSubject sb on a.id = sb.subjectId " +
            "join Student s on s.id = sb.studentId " +
            "where s.id = :studentId")
    List<SubjectDto> getSubjectByStudentId(@Param("studentId") String studentId);

//    @Query(value ="SELECT distinct subject.id, subject.name, subject.credit, subject.faculty_id\n"
//            + "FROM subject join student_subject on student_subject.subject_id = subject.id\n"
//            + "join student on student.id = student_subject.student_id\n"
//            + "join score on score.student_subject_id = student_subject.id\n"
//            + "join semester on score.semester_id = semester.id\n"
//            + "where student.id = :studentId and semester.id = :semesterId",nativeQuery = true)

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) \n" +
            "from Subject a \n" +
            "join StudentSubject sb on a.id = sb.subjectId \n" +
            "join Student s on s.id = sb.studentId \n " +
            "join Score sc on sc.studentSubjectId = sb.id \n" +
            "join Semester se on sc.semesterId = se.id \n" +
            "where s.id = :studentId and se.id = :semesterId")
    List<SubjectDto> getSubjectByStudentAndSemesterId(@Param("studentId") String studentId, @Param("semesterId") String semesterId);
}
