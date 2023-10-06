package com.nmt.universitysb.service;

import com.nmt.universitysb.dto.ScoreDto;
import com.nmt.universitysb.dto.ScoreListDto;
import com.nmt.universitysb.dto.Score_ScoreValueDto;
import com.nmt.universitysb.dto.StudentScoreDTO;
import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreValue;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ScoreService {
    List<Score> findAll();
    Page<Score> findAll(Pageable pageable);

    Optional<Score> findById(int id);

    Page<Score> findAllByIdContaining(String keyword, Pageable pageable);
    Score save(Score f);
    boolean deleteScore(int id);

    List<ScoreDto> getScoreByStudentId(String studentId, String subjectId, String semesterId);
    List<ScoreListDto> getListScoreStudent(String studentId, String semesterId);
    List<StudentScoreDTO> getStudentScores(String lecturerId, String semesterId, String subjectId);
    List<Score_ScoreValueDto> addScore(List<Map<String, String>> scoreParamsList);
}
