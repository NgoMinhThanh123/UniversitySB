package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.Semester;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SemesterRepository extends JpaRepository<Semester, String> {

    List<Semester> findAll();
    Optional<Semester> findById(String id);

    long count();
    Semester save(Semester f);
    void deleteById(String id);

//    List<Semester> getSemesters(Map<String, String> params);
//    int countSemesters();
//    boolean addSemester(Semester m);
//    boolean updateSemester(Semester m);
//    Semester getSemesterById(String id);
//    List<Semester> getSemesterByLecturerId(String lecturerId);
//    List<Semester> getSemesterByStudentId(String studentId);
//    boolean deleteSemester(String id);
}
