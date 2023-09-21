package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Lecturer;

import java.util.List;
import java.util.Optional;

public interface LecturerService {
    List<Lecturer> findAll();
    Optional<Lecturer> findById(String id);
    long count();
    Lecturer save(Lecturer f);
    boolean deleteLecturer(String id);
//    List<Lecturer> getLecturers(Map<String, String> params);
//    boolean addLeturer(Lecturer l);
//    boolean updateLeturer(Lecturer l);
//    Lecturer getLecturerById(String id);
//    int countLecturers();
//    boolean deleteLecturer(String id);
//    LecturerDto getLecturerByUsername(String username);
}
