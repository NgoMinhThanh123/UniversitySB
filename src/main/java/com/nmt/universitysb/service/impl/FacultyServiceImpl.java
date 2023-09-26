package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.Faculty;
import com.nmt.universitysb.repository.FacultyRepository;
import com.nmt.universitysb.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class FacultyServiceImpl implements FacultyService {
    @Autowired
    private FacultyRepository facultyRepo;

    @Override
    public List<Faculty> findAll() {
        return this.facultyRepo.findAll();
    }

    @Override
    public Page<Faculty> findAll(Pageable pageable) {
        return this.facultyRepo.findAll(pageable);
    }

    @Override
    public Optional<Faculty> findById(String id) {
        return this.facultyRepo.findById(id);
    }

    @Override
    public Page<Faculty> findAllByNameContaining(String keyword, Pageable pageable) {
        return this.facultyRepo.findAllByNameContaining(keyword, pageable);
    }

    @Override
    public Faculty save(Faculty f) {
        return this.facultyRepo.save(f);
    }

    @Override
    public boolean deleteFaculty(String id) {
        this.facultyRepo.deleteById(id);
        return true;
    }


//    @Override
//    public List<Faculty> getFaculties(Map<String, String> params) {
//        return this.facultyRepo.getFaculties(params);
//    }

//    @Override
//    public Faculty getFacultyById(String id) {
//        return this.facultyRepo.getFacultyById(id);
//    }
//
//    @Override
//    public boolean addFaculty(Faculty f) {
//        return this.facultyRepo.addFaculty(f);
//    }
//
//    @Override
//    public boolean updateFaculty(Faculty f) {
//        return this.facultyRepo.updateFaculty(f);
//    }
//
//    @Override
//    public boolean deleteFaculty(String id) {
//        return this.facultyRepo.deleteFaculty(id);
//    }
//
//    @Override
//    public int countFaculties() {
//        return this.facultyRepo.countFaculties();
//    }
}
