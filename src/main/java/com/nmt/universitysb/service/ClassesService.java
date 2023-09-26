package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Classes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ClassesService {
    List<Classes> findAll();
    Page<Classes> findAll(Pageable pageable);
    Optional<Classes> findById(String id);

    Page<Classes> findAllByIdContaining(String keyword, Pageable pageable);
    Classes save(Classes f);
    boolean deleteClasse(String id);
//    List<Classes> getClasses(Map<String, String> params);
//    int countClasses();
//    boolean addClass(Classes c);
//    boolean updateClass(Classes c);
//    Classes getClassById(String id);
//    boolean deleteClass(String id);
}
