package com.nmt.universitysb.repository;

import com.nmt.universitysb.dto.ScoreDto;
import com.nmt.universitysb.dto.StudentScoreDTO;
import com.nmt.universitysb.model.*;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScoreRepository extends JpaRepository<Score, Integer> {
    Optional<Score> findById(int id);
    Page<Score> findAllByIdContaining(String keyword, Pageable pageable);
@Query("select a" +
        " from Score a where a.studentSubjectId.id = :studentSubjectId AND a.semesterId.id = :semesterId")
Optional<Score> findByStudentSubjectIdAndSemesterId(@Param("studentSubjectId") int studentSubjectId, @Param("semesterId") String semesterId);
    long count();
    Score save(Score f);
    void deleteById(int id);
    @Query("select new com.nmt.universitysb.dto.ScoreDto(sc.name, sv.value) \n"
            + "FROM ScoreColumn sc \n"
            + "left join ScoreValue sv on sv.scoreColumnId.id = sc.id\n"
            + "left join Score s on sv.scoreId.id = s.id\n"
            + "join StudentSubject ss on s.studentSubjectId.id = ss.id\n"
            + "join Subject su on ss.subjectId.id = su.id\n"
            + "join Semester se on s.semesterId.id = se.id\n"
            + "left join Student st on ss.studentId.id = st.id\n"
            + "join LecturerSubject lb on lb.subjectId.id = su.id\n"
            + "join Lecturer l on lb.lecturerId.id = l.id\n"
            + "where st.id = :studentId and su.id = :subjectId and se.id = :semesterId \n"
            + "group by sc.name, sv.value")
    List<ScoreDto> getScoreByStudentId(@Param("studentId") String studentId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.StudentScoreDTO(su.name, se.name, se.schoolYear, st.id, st.name, sc.name, sv.value) \n" +
            "from Score s\n" +
            "join StudentSubject ss on s.studentSubjectId.id = ss.id\n" +
            "join Student st on ss.studentId.id= st.id\n " +
            "join Subject su on ss.subjectId.id = su.id\n" +
            "join Semester se on s.semesterId.id = se.id\n" +
            "join LecturerSubject lb on lb.subjectId.id = su.id\n" +
            "join Lecturer l on lb.lecturerId.id = l.id\n"+
            "left join ScoreValue sv on sv.scoreId.id = s.id\n" +
            "left join ScoreColumn sc on sv.scoreColumnId.id = sc.id\n" +
            "where l.id = :lecturerId and se.id = :semesterId and su.id = :subjectId")
    List<StudentScoreDTO> getStudentScores(@Param("lecturerId") String lecturerId, @Param("semesterId") String semesterId, @Param("subjectId") String subjectId);

    //Calculate final score for 1 subject
    @Query("SELECT new com.nmt.universitysb.dto.ScoreDto(sc.name, SumPercent.total ) " +
            "FROM ( " +
            "    SELECT  ROUND(SUM(CASE WHEN sc.id = 2 THEN sv.value * sp.percentGK " +
            "         WHEN sc.id = 3 THEN sv.value * sp.percentCK " +
            "         ELSE 0 END), 2) AS total " +
            "    FROM ScoreColumn sc " +
            "    LEFT JOIN ScoreValue sv ON sv.scoreColumnId.id = sc.id " +
            "    LEFT JOIN Score s ON sv.scoreId.id = s.id " +
            "    JOIN StudentSubject ss ON s.studentSubjectId.id = ss.id " +
            "    JOIN Subject su ON ss.subjectId.id = su.id " +
            "    JOIN ScorePercent sp ON sp.subjectId.id = su.id " +
            "    JOIN Semester se ON s.semesterId.id = se.id " +
            "    LEFT JOIN Student st ON ss.studentId.id = st.id " +
            "    JOIN LecturerSubject lb ON lb.subjectId.id = su.id " +
            "    JOIN Lecturer l ON lb.lecturerId.id = l.id " +
            "    WHERE st.id = :studentId AND su.id = :subjectId AND se.id = :semesterId " +
            ") AS SumPercent, ScoreColumn sc WHERE sc.id = 5")
    ScoreDto getFinalScoreForSubject(@Param("studentId") String studentId,
                                     @Param("subjectId") String subjectId,
                                     @Param("semesterId") String semesterId);
}
