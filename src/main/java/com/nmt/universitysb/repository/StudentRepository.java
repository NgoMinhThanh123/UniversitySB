package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentRepository extends JpaRepository<Student, String> {
//    List<Student> getStudents(Map<String, String> params);
//    int countStudents();
//    boolean addStudent(Student c);
//    boolean updateStudent(Student c);
//    Student getStudentById(String id);
//    Student getStudentByUsername(String username);
//    List<Student> getStudentByHomeroomTeacher(String lecturerId);
//    boolean deleteStudent(String id);
//    List<Student> getListStudent(String lecturerId, String subjectId, String semesterID);
//    List<String> getAllMailOfStudent(String lecturerId, String subjectId, String semesterId);

}
