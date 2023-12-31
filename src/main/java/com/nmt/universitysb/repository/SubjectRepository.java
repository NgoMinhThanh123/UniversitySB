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

    @Query("select new com.nmt.universitysb.dto.SubjectDto(s.id, s.name, s.credit, s.facultyId ) " +
            "from Subject s " +
            "join SubjectSemester ss on s.id = ss.subjectId " +
            "join Semester se on se.id = ss.semesterId " +
            "where se.id = :semesterId")
    List<SubjectDto> getSubjectBySemesterId(@Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) " +
            "from Subject a " +
            "join StudentSubject sb on a.id = sb.subjectId " +
            "join Student s on s.id = sb.studentId " +
            "where s.id = :studentId")
    List<SubjectDto> getSubjectByStudentId(@Param("studentId") String studentId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) " +
            "from Subject a " +
            "join SubjectSemester ss on a.id = ss.subjectId " +
            "join Semester s on s.id = ss.semesterId " +
            "where a.facultyId.id = :facultyId and s.id = :semesterId")
    List<SubjectDto> getSubjectByFacultyId(@Param("facultyId") String facultyId, @Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.facultyId ) \n" +
            "from Subject a \n" +
            "join StudentSubject sb on a.id = sb.subjectId \n" +
            "join Student s on s.id = sb.studentId \n " +
            "join Score sc on sc.studentSubjectId = sb.id \n" +
            "join Semester se on sc.semesterId = se.id \n" +
            "where s.id = :studentId and se.id = :semesterId")
    List<SubjectDto> getSubjectByStudentAndSemesterId(@Param("studentId") String studentId, @Param("semesterId") String semesterId);
}
