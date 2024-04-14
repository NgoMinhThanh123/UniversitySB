package com.nmt.universitysb.repository;
import com.nmt.universitysb.dto.SubjectDto;
import com.nmt.universitysb.model.Subject;
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

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.majorId ) " +
            "from Subject a " +
            "join LecturerSubject ls on a.id = ls.subjectId " +
            "join Lecturer l on l.id = ls.lecturerId " +
            "where l.id = :lecturerId")
    List<SubjectDto> getSubjectByLecturerId(@Param("lecturerId") String lecturerId);

    @Query("Select a.credit " +
            "from Subject a " +
            "where a.id = :SubjectId")
    Long getCreditBySubjectId(@Param("SubjectId") String SubjectId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(s.id, s.name, s.credit, s.majorId ) " +
            "from Subject s " +
            "join SubjectSemester ss on s.id = ss.subjectId " +
            "join Semester se on se.id = ss.semesterId " +
            "where se.id = :semesterId")
    List<SubjectDto> getSubjectBySemesterId(@Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.majorId ) " +
            "from Subject a " +
            "join StudentSubject sb on a.id = sb.subjectId " +
            "join Student s on s.id = sb.studentId " +
            "where s.id = :studentId")
    List<SubjectDto> getSubjectByStudentId(@Param("studentId") String studentId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.majorId ) " +
            "from Subject a " +
            "join SubjectSemester ss on a.id = ss.subjectId " +
            "join Semester s on s.id = ss.semesterId " +
            "where a.majorId.id = :majorId and s.id = :semesterId")
    List<SubjectDto> getSubjectByMajorId(@Param("majorId") String majorId, @Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(a.id, a.name, a.credit, a.majorId ) \n" +
            "from Subject a \n" +
            "join StudentSubject sb on a.id = sb.subjectId \n" +
            "join Student s on s.id = sb.studentId.id \n " +
            "join Score sc on sc.studentSubjectId.id = sb.id \n" +
            "join Semester se on sc.semesterId = se.id \n" +
            "where s.id = :studentId and se.id = :semesterId")
    List<SubjectDto> getSubjectByStudentAndSemesterId(@Param("studentId") String studentId, @Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.SubjectDto(s.id, s.name, s.credit, s.majorId ) " +
            "from Subject s \n" +
            "join StudentSubject ss on s.id = ss.subjectId.id \n" +
            "join Student st on st.id = ss.studentId.id \n" +
            "join SubjectSemester se on s.id = ss.subjectId.id " +
            "join Semester sr on sr.id = se.semesterId.id " +
            "where ss.status = false and st.id = :studentId and sr.id = :semesterId")
    List<SubjectDto> getSubjectTemporaryCourse(@Param("studentId") String studentId, @Param("semesterId") String semesterId);
}
