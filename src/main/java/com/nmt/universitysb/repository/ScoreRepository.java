package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreValue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
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
//    List<Score> getScores(Map<String, String> params);
//    int countScores();
//    boolean addOrUpdateScore(Score u);
//    Score getScoreById(int id);
//    List<ScoreDto> getScoreByStudentId(String studentId, String subjectId, String semesterId);
//    List<StudentScoreDTO> getStudentScores(String lecturerId, String semesterId, String subjectId);
//    List<StudentScoreDTO> getListScoresExport(String subjectId, String semesterId);
//    Score addScore(Score score);
//    boolean deleteScore(int id);
}
