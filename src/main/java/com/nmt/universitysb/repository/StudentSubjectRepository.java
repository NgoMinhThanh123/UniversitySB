package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.StudentSubject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentSubjectRepository extends JpaRepository<StudentSubject, Integer> {
//    List<StudentSubject> getStudentSubjects(Map<String, String> params);
//    StudentSubject getStudentSubjectById(int id);
//    boolean addOrUpdateStudentSubject(StudentSubject st);
//    boolean deleteStudentSubject(int id);
//    StudentSubject getStudentSubjectByStudentAndSubjectId(String studentId, String subjectId);
//    int countStudentSubject();
}
