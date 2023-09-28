package com.nmt.universitysb.repository;

import com.nmt.universitysb.dto.ScoreDto;
import com.nmt.universitysb.dto.StudentScoreDTO;
import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreValue;
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
    long count();
    Score save(Score f);
    void deleteById(int id);
    @Query("select new com.nmt.universitysb.dto.ScoreDto(sc.name, sv.value) \n"
            + "FROM ScoreColumn sc \n"
            + "left join ScoreValue sv on sv.scoreColumnId = sc.id\n"
            + "left join Score s on sv.scoreId = s.id\n"
            + "join StudentSubject ss on s.studentSubjectId = ss.id\n"
            + "join Subject su on ss.subjectId = su.id\n"
            + "join Semester se on s.semesterId = se.id\n"
            + "join Student st on ss.studentId = st.id\n"
            + "join LecturerSubject lb on lb.subjectId = su.id\n"
            + "join Lecturer l on lb.lecturerId = l.id\n"
            + "where st.id = :studentId and su.id = :subjectId and se.id = :semesterId \n"
            + "group by sc.name, sv.value")
    List<ScoreDto> getScoreByStudentId(@Param("studentId") String studentId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

    @Query("select new com.nmt.universitysb.dto.StudentScoreDTO(su.name, se.name, se.schoolYear, st.id, st.name, sc.name, sv.value) \n" +
            "from Score s\n" +
            "join StudentSubject ss on s.studentSubjectId = ss.id\n" +
            "join Student st on ss.studentId= st.id\n " +
            "join Subject su on ss.subjectId= su.id\n" +
            "join Semester se on s.semesterId = se.id\n"
            + "join LecturerSubject lb on lb.subjectId = su.id\n"
            + "join Lecturer l on lb.lecturerId = l.id\n"
            + "join ScoreValue sv on sv.scoreId = s.id\n"
            + "join ScoreColumn sc on sv.scoreColumnId = sc.id\n"
            + "where l.id = :lecturerId and se.id = :semesterId and su.id = :subjectId")
    List<StudentScoreDTO> getStudentScores(@Param("lecturerId") String lecturerId, @Param("semesterId") String semesterId, @Param("subjectId") String subjectId);
//    List<StudentScoreDTO> getListScoresExport(String subjectId, String semesterId);
//    Score addScore(Score score);
}
