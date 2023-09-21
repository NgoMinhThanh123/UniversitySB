package com.nmt.universitysb.service;

import com.nmt.universitysb.model.Lecturer;
import com.nmt.universitysb.model.Student;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface StudentService {
    List<Student> findAll();
    Optional<Student> findById(String id);
    long count();
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
