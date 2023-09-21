package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.ScoreColumn;
import com.nmt.universitysb.model.ScoreValue;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScoreValueRepository extends JpaRepository<ScoreValue, Integer> {
    List<ScoreValue> findAll();
    Optional<ScoreValue> findById(int id);

    long count();
    ScoreValue save(ScoreValue f);
    void deleteById(int id);
//    List<ScoreValue> getScoreValues(Map<String, String> params);
//    int countScoreValues();
//    boolean addOrUpdateScoreValue(ScoreValue u);
//    ScoreValue addScoreValue(ScoreValue u);
//    ScoreValue getScoreValueById(int id);
//    boolean deleteScoreValue(int id);
}
