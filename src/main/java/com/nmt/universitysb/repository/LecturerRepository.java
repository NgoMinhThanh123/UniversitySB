package com.nmt.universitysb.repository;///*

import com.nmt.universitysb.model.Lecturer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LecturerRepository extends JpaRepository<Lecturer, String> {
    Optional<Lecturer> findById(String id);

    Page<Lecturer> findAllByNameContaining(String keyword, Pageable pageable);
    Lecturer save(Lecturer f);
    void deleteById(String id);
//    List<Lecturer> getLecturers(Map<String, String> params);
//    boolean addLeturer(Lecturer l);
//    boolean updateLeturer(Lecturer l);
//    Lecturer getLecturerById(String id);
//    int countLecturers();
//    boolean deleteLecturer(String id);
//    Lecturer getLecturerByUsername(String username);
}
