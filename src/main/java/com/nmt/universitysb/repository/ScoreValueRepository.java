package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.ScoreColumn;
import com.nmt.universitysb.model.ScoreValue;
import com.nmt.universitysb.model.Semester;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScoreValueRepository extends JpaRepository<ScoreValue, Integer> {
    Optional<ScoreValue> findById(int id);
    Page<ScoreValue> findAllByIdContaining(String keyword, Pageable pageable);
    ScoreValue save(ScoreValue f);
    void deleteById(int id);
//    List<ScoreValue> getScoreValues(Map<String, String> params);
//    int countScoreValues();
//    boolean addOrUpdateScoreValue(ScoreValue u);
//    ScoreValue addScoreValue(ScoreValue u);
//    ScoreValue getScoreValueById(int id);
//    boolean deleteScoreValue(int id);
}
