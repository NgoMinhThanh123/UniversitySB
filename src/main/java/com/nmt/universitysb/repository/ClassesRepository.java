package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Classes;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ClassesRepository extends JpaRepository<Classes, String> {
    Optional<Classes> findById(String id);

    Page<Classes> findAllByIdContaining(String keyword, Pageable pageable);
    Classes save(Classes f);
    void deleteById(String id);
//    List<Classes> getClasses(Map<String, String> params);
//    int countClasses();
//    boolean addClass(Classes c);
//    boolean updateClass(Classes c);
//    Classes getClassById(String id);
//    boolean deleteClass(String id);
}
