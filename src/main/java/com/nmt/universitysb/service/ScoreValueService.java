package com.nmt.universitysb.service;
import com.nmt.universitysb.model.ScoreValue;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ScoreValueService {
    List<ScoreValue> findAll();
    Optional<ScoreValue> findById(int id);

    long count();
    ScoreValue save(ScoreValue f);
    boolean deleteScoreValue(int id);
//    List<ScoreValue> getScoreValues(Map<String, String> params);
//    int countScoreValues();
//    boolean addOrUpdateScoreValue(ScoreValue u);
//    ScoreValue addScoreValue(ScoreValue u);
//    ScoreValue getScoreValueById(int id);
//    boolean deleteScoreValue(int id);
}
