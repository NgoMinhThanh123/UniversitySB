package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.ScorePercent;
import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.model.Subject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ScorePercentRepository extends JpaRepository<ScorePercent, String> {
    Optional<ScorePercent> findById(String id);

    Page<ScorePercent> findAllBySubjectIdContaining(String keyword, Pageable pageable);
    ScorePercent save(ScorePercent f);
    void deleteById(String id);
    Optional<ScorePercent> findAllBySubjectId(String subjectId);
}
