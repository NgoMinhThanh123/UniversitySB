package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.CreditPrice;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CreditPriceRepository extends JpaRepository<CreditPrice, String> {
    Optional<CreditPrice> findById(String id);

    Page<CreditPrice> findAllByMajorIdContaining(String keyword, Pageable pageable);
    CreditPrice save(CreditPrice f);
    void deleteById(String id);
}
