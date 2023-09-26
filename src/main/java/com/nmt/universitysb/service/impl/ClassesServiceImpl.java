package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.ClassesRepository;
import com.nmt.universitysb.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ClassesServiceImpl implements ClassesService {
    @Autowired
    private ClassesRepository classesRepo;

    @Override
    public List<Classes> findAll() {
        return this.classesRepo.findAll();
    }

    @Override
    public Page<Classes> findAll(Pageable pageable) {
        return this.classesRepo.findAll(pageable);
    }

    @Override
    public Optional<Classes> findById(String id) {
        return this.classesRepo.findById(id);
    }

    @Override
    public Page<Classes> findAllByIdContaining(String keyword, Pageable pageable) {
        return this.classesRepo.findAllByIdContaining(keyword, pageable);
    }


    @Override
    public Classes save(Classes f) {
        return this.classesRepo.save(f);
    }

    @Override
    public boolean deleteClasse(String id) {
        this.classesRepo.deleteById(id);
        return true;
    }

//    @Override
//    public List<Classes> getClasses(Map<String, String> params) {
//        return this.classesRepo.getClasses(params);
//    }
//
//    @Override
//    public boolean addClass(Classes c) {
//        return this.classesRepo.addClass(c);
//    }
//
//    @Override
//    public boolean updateClass(Classes c) {
//        return this.classesRepo.updateClass(c);
//    }
//
//    @Override
//    public Classes getClassById(String id) {
//        return this.classesRepo.getClassById(id);
//    }
//
//    @Override
//    public boolean deleteClass(String id) {
//        return this.classesRepo.deleteClass(id);
//    }
//
//    @Override
//    public int countClasses() {
//        return this.classesRepo.countClasses();
//    }
}
