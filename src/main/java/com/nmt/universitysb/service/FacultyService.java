package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Faculty;

import java.util.List;
import java.util.Optional;

public interface FacultyService {
    List<Faculty> findAll();
    Optional<Faculty> findById(String id);

    long count();
    Faculty save(Faculty f);
    boolean deleteFaculty(String id);
}
