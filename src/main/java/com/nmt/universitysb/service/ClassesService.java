package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.Faculty;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface ClassesService {
    List<Classes> findAll();
    Optional<Classes> findById(String id);

    long count();
    Classes save(Classes f);
    boolean deleteClasse(String id);
//    List<Classes> getClasses(Map<String, String> params);
//    int countClasses();
//    boolean addClass(Classes c);
//    boolean updateClass(Classes c);
//    Classes getClassById(String id);
//    boolean deleteClass(String id);
}
