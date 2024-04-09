package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.TuitionFee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Repository
public interface TuitionFeeRepository extends JpaRepository<TuitionFee, String> {

    Optional<TuitionFee> findById(int id);
    @Query("select a from TuitionFee a where a.id = :id")
    TuitionFee findByTuitionFeeId(@RequestParam("id") int id);
    Page<TuitionFee> findAllByStudentIdContaining(String keyword, Pageable pageable);
    TuitionFee save(TuitionFee f);
    void deleteById(String id);
}
