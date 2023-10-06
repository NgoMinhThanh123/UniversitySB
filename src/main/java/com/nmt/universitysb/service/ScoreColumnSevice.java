package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Score;
import com.nmt.universitysb.model.ScoreColumn;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ScoreColumnSevice {
    List<ScoreColumn> findAll();
    Page<ScoreColumn> findAll(Pageable pageable);

    Optional<ScoreColumn> findById(int id);
    Page<ScoreColumn> findAllByNameContaining(String keyword, Pageable pageable);

    ScoreColumn save(ScoreColumn f);
    boolean deleteScoreColumn(int id);
//    List<ScoreColumn> getScoreColumns(Map<String, String> params);
//    int countScoreColumns();
//    boolean addOrUpdateScoreColumn(ScoreColumn u);
//    boolean addScoreColumn(ScoreColumn u);
//    ScoreColumn getScoreColumnById(int id);
//    boolean deleteScoreColumn(int id);
}