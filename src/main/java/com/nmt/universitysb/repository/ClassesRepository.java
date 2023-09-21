package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.model.Faculty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClassesRepository extends JpaRepository<Classes, String> {
    List<Classes> findAll();
    Optional<Classes> findById(String id);

    long count();
    Classes save(Classes f);
    void deleteById(String id);
//    List<Classes> getClasses(Map<String, String> params);
//    int countClasses();
//    boolean addClass(Classes c);
//    boolean updateClass(Classes c);
//    Classes getClassById(String id);
//    boolean deleteClass(String id);
}
