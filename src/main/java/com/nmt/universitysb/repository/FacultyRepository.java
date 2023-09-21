package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FacultyRepository extends JpaRepository<Faculty, String> {

    List<Faculty> findAll();
    Optional<Faculty> findById(String id);

    long count();
    Faculty save(Faculty f);
    void deleteById(String id);
}
