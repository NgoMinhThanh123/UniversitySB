package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface StudentService {
    List<Student> findAll();
    Page<Student> findAll(Pageable pageable);
    Optional<Student> findById(String id);
    Page<Student> findAllByNameContaining(String keyword, Pageable pageable);
    Student save(Student f);
    boolean deleteStudent(String id);
//    List<Student> getStudents(Map<String, String> params);
//    int countStudents();
//    boolean addStudent(Student c);
//    boolean updateStudent(Student c);
//    Student getStudentById(String id);
//    boolean deleteStudent(String id);
//    StudentDto getStudentByUsername(String username);
//    List<Student> getStudentByHomeroomTeacher(String lecturerId);
//    List<StuScoreDto> getListStudent(String lectureId, String subjectId, String semesterId);
//    List<String> getAllMailOfStudent(String lecturerId, String subjectId, String semesterId);

}
