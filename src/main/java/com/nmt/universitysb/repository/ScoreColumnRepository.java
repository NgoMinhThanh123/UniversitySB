package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreColumn;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScoreColumnRepository extends JpaRepository<ScoreColumn, Integer> {
    Optional<ScoreColumn> findById(int id);
    Page<ScoreColumn> findAllByNameContaining(String keyword, Pageable pageable);
    ScoreColumn save(ScoreColumn f);
    void deleteById(int id);
//    List<ScoreColumn> getScoreColumns(Map<String, String> params);
//    int countScoreColumns();
//    boolean addOrUpdateScoreColumn(ScoreColumn u);
//    boolean addScoreColumn(ScoreColumn u);
//    ScoreColumn getScoreColumnById(int id);
//    boolean deleteScoreColumn(int id);
}
