package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Lecturer;
import com.nmt.universitysb.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface LecturerService {
    List<Lecturer> findAll();
    Page<Lecturer> findAll(Pageable pageable);
    Optional<Lecturer> findById(String id);
    Page<Lecturer> findAllByNameContaining(String keyword, Pageable pageable);
    Lecturer save(Lecturer f);
    Lecturer saveAndCreateUser(Lecturer f);
    List<Lecturer> save(List<Lecturer> lecturers);
    long count();
    boolean deleteLecturer(String id);
    Lecturer getLecturerByUsername(String username);
}
