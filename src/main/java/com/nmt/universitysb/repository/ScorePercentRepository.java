package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.ScorePercent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface ScorePercentRepository extends JpaRepository<ScorePercent, String> {
    Optional<ScorePercent> findById(String id);

    Page<ScorePercent> findAllBySubjectIdContaining(String keyword, Pageable pageable);
    ScorePercent save(ScorePercent f);
    void deleteById(String id);
}
