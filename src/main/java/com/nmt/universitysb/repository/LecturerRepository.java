package com.nmt.universitysb.repository;///*

import com.nmt.universitysb.model.Lecturer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LecturerRepository extends JpaRepository<Lecturer, String> {
    List<Lecturer> findAll();
    Optional<Lecturer> findById(String id);

    long count();
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
