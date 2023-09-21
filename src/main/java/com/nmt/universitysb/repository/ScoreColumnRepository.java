package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreColumn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScoreColumnRepository extends JpaRepository<ScoreColumn, Integer> {
    List<ScoreColumn> findAll();
    Optional<ScoreColumn> findById(int id);

    long count();
    ScoreColumn save(ScoreColumn f);
    void deleteById(int id);
//    List<ScoreColumn> getScoreColumns(Map<String, String> params);
//    int countScoreColumns();
//    boolean addOrUpdateScoreColumn(ScoreColumn u);
//    boolean addScoreColumn(ScoreColumn u);
//    ScoreColumn getScoreColumnById(int id);
//    boolean deleteScoreColumn(int id);
}
