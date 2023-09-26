package com.nmt.universitysb.service;
import com.nmt.universitysb.model.ScoreValue;
import com.nmt.universitysb.model.Semester;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ScoreValueService {
    List<ScoreValue> findAll();
    Page<ScoreValue> findAll(Pageable pageable);

    Optional<ScoreValue> findById(int id);
    Page<ScoreValue> findAllByIdContaining(String keyword, Pageable pageable);
    ScoreValue save(ScoreValue f);
    boolean deleteScoreValue(int id);
//    List<ScoreValue> getScoreValues(Map<String, String> params);
//    int countScoreValues();
//    boolean addOrUpdateScoreValue(ScoreValue u);
//    ScoreValue addScoreValue(ScoreValue u);
//    ScoreValue getScoreValueById(int id);
//    boolean deleteScoreValue(int id);
}
