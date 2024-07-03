package com.nmt.universitysb.repository;
import com.nmt.universitysb.dto.StudentSubjectDto;
import com.nmt.universitysb.model.StudentSubject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentSubjectRepository extends JpaRepository<StudentSubject, Integer> {
    Optional<StudentSubject> findById(int id);
    Page<StudentSubject> findAllByStudentIdContaining(String keyword, Pageable pageable);
    StudentSubject save(StudentSubject f);
    void deleteById(int id);
    @Query("select a" +
            " from StudentSubject a where a.studentId.id = :studentId AND a.subjectId.id = :subjectId and a.semesterId.id = :semesterId ")
    Optional<StudentSubject> getStudentSubjectByStudentAndSubjectId(@Param("studentId") String studentId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

    @Query("select distinct new com.nmt.universitysb.dto.StudentSubjectDto(ss.id, ss.status, ss.studentId, ss.subjectId, ss.semesterId) " +
            "from StudentSubject ss " +
            "where ss.studentId.id = :studentId AND ss.subjectId.id = :subjectId AND ss.semesterId.id = :semesterId")
    StudentSubjectDto getStudentSubjectByStudentSubjectSemester(@Param("studentId") String studentId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

    @Query("select distinct new com.nmt.universitysb.dto.StudentSubjectDto(ss.id, ss.status, ss.studentId, ss.subjectId, ss.semesterId) " +
            "from StudentSubject ss \n" +
            "join Subject s on s.id = ss.subjectId.id \n" +
            "join Student st on st.id = ss.studentId.id \n" +
            "join Semester sr on ss.semesterId.id = sr.id " +
            "where ss.status = false and st.id = :studentId and sr.id = :semesterId")
    List<StudentSubjectDto> getTemporaryCourse(@Param("studentId") String studentId, @Param("semesterId") String semesterId);

    @Query("select distinct new com.nmt.universitysb.dto.StudentSubjectDto(ss.id, ss.status, ss.studentId, ss.subjectId, ss.semesterId) " +
            "from StudentSubject ss \n" +
            "join Subject s on s.id = ss.subjectId.id \n" +
            "join Student st on st.id = ss.studentId.id \n" +
            "join Semester sr on sr.id = ss.semesterId.id " +
            "where ss.status = true and st.id = :studentId and sr.id = :semesterId")
    List<StudentSubjectDto> getAlreadyCourse(@Param("studentId") String studentId, @Param("semesterId") String semesterId);
}
