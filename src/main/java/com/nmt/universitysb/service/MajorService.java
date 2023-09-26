package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Major;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface MajorService {
    List<Major> findAll();
    Page<Major> findAll(Pageable pageable);
    Optional<Major> findById(String id);

    Page<Major> findAllByNameContaining(String keyword, Pageable pageable);
    Major save(Major f);

    boolean deleteMajor(String id);
//    List<Major> getMajors(Map<String, String> params);
//    int countMajors();
//    boolean addMajor(Major m);
//    boolean updateMajor(Major m);
//    Major getMajorById(String id);
//    boolean deleteMajor(String id);
}
