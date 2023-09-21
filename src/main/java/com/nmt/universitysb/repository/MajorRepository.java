package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Major;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MajorRepository extends JpaRepository<Major, String> {

    List<Major> findAll();
    Optional<Major> findById(String id);

    long count();
    Major save(Major f);
    void deleteById(String id);
//    List<Major> getMajors(Map<String, String> params);
//    int countMajors();
//    boolean addMajor(Major m);
//    boolean updateMajor(Major m);
//    Major getMajorById(String id);
//    boolean deleteMajor(String id);

}
