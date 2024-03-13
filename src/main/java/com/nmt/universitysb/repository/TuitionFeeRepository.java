package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.TuitionFee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TuitionFeeRepository extends JpaRepository<TuitionFee, String> {
    Optional<TuitionFee> findById(String id);

    Page<TuitionFee> findAllByStudentIdContaining(String keyword, Pageable pageable);
    TuitionFee save(TuitionFee f);
    void deleteById(String id);
}
