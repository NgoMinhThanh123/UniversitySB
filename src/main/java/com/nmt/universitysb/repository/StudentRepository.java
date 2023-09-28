package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student, String> {
    Optional<Student> findById(String id);

    Page<Student> findAllByNameContaining(String keyword, Pageable pageable);
    Student save(Student f);
    void deleteById(String id);
    @Query("select a from Student a where a.userId.username = :username")
    Student getStudentByUsername(String username);
    @Query(value ="SELECT student.* \n"
            + "FROM student\n"
            + "join classes on student.classes_id = classes.id\n"
            + "join lecturer on classes.id = lecturer.classes_id\n"
            + "where lecturer.id = :lecturerId",nativeQuery = true)
    List<Student> getStudentByHomeroomTeacher(@Param("lecturerId") String lecturerId);
    @Query(value ="SELECT distinct student.* \n"
            + "FROM score\n"
            + "join student_subject on score.student_subject_id = student_subject.id\n"
            + "JOIN subject ON student_subject.subject_id = subject.id\n"
            + "JOIN semester ON score.semester_id = semester.id\n"
            + "JOIN student ON student_subject.student_id = student.id\n"
            + "JOIN lecturer_subject ON lecturer_subject.subject_id = subject.id\n"
            + "JOIN lecturer ON lecturer_subject.lecturer_id = lecturer.id\n"
            + "LEFT JOIN score_value ON score_value.score_id = score.id\n"
            + "LEFT JOIN score_column ON score_value.score_column_id = score_column.id\n"
            + "WHERE lecturer.id = :lecturerId AND subject.id = :subjectId AND semester.id = :semesterId",nativeQuery = true)
    List<Student> getListStudent(@Param("lecturerId") String lecturerId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

    @Query(value ="SELECT user.email \n"
            + "FROM student \n"
            + "JOIN user ON student.user_id = user.id\n"
            + "join student_subject on student_subject.student_id = student.id\n"
            + "join subject on student_subject.subject_id = subject.id\n"
            + "join subject_semester on subject_semester.subject_id = subject.id\n"
            + "join semester on subject_semester.semester_id = semester.id\n"
            + "join lecturer_subject on lecturer_subject.subject_id = subject.id\n"
            + "join lecturer on lecturer_subject.lecturer_id = lecturer.id\n"
            + "where lecturer.id = :lecturerId and subject.id = :subjectId and semester.id = :semesterId",nativeQuery = true)
    List<String> getAllMailOfStudent(@Param("lecturerId") String lecturerId, @Param("subjectId") String subjectId, @Param("semesterId") String semesterId);

}
