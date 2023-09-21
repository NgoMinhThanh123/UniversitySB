package com.nmt.universitysb.service.impl;

import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.repository.SemesterRepository;
import com.nmt.universitysb.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SemesterServiceImpl implements SemesterService {
    @Autowired
    private SemesterRepository semesRepo;

    @Override
    public List<Semester> findAll() {
        return  this.semesRepo.findAll();
    }

    @Override
    public Optional<Semester> findById(String id) {
        return this.semesRepo.findById(id);
    }

    @Override
    public long count() {
        return this.semesRepo.count();
    }

    @Override
    public Semester save(Semester f) {
        return this.semesRepo.save(f);
    }

    @Override
    public boolean deleteSemester(String id) {
        this.semesRepo.deleteById(id);
        return true;
    }
}
