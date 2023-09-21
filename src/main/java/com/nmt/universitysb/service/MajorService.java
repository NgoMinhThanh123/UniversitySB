package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Major;

import java.util.List;
import java.util.Optional;

public interface MajorService {
    List<Major> findAll();
    Optional<Major> findById(String id);

    long count();
    Major save(Major f);

    boolean deleteMajor(String id);
//    List<Major> getMajors(Map<String, String> params);
//    int countMajors();
//    boolean addMajor(Major m);
//    boolean updateMajor(Major m);
//    Major getMajorById(String id);
//    boolean deleteMajor(String id);
}
