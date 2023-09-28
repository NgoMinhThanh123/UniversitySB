package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.dto.StudentSubjectDto;
import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.model.StudentSubject;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.StudentRepository;
import com.nmt.universitysb.repository.StudentSubjectRepository;
import com.nmt.universitysb.repository.SubjectRepository;
import com.nmt.universitysb.service.StudentSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class StudentSubjectServiceImpl implements StudentSubjectService {
    @Autowired
    private StudentSubjectRepository studentSubjectRepository;
    @Autowired
    private StudentRepository studentRepo;
    @Autowired
    private SubjectRepository subjectRepo;

    @Override
    public List<StudentSubject> findAll() {
        return this.studentSubjectRepository.findAll();
    }

    @Override
    public Page<StudentSubject> findAll(Pageable pageable) {
        return this.studentSubjectRepository.findAll(pageable);
    }

    @Override
    public Optional<StudentSubject> findById(int id) {
        return this.studentSubjectRepository.findById(id);
    }

    @Override
    public Page<StudentSubject> findAllByStudentIdContaining(String keyword, Pageable pageable) {
        return this.studentSubjectRepository.findAllByStudentIdContaining(keyword, pageable);
    }

    @Override
    public StudentSubject save(StudentSubject f) {
        return this.studentSubjectRepository.save(f);
    }

    @Override
    public List<StudentSubjectDto> courseRegister(List<Map<String, String>> paramsList) {
        List<StudentSubjectDto> studentSubjects = new ArrayList<>();
        for (Map<String, String> params : paramsList) {
            Optional<Student> student = this.studentRepo.findById(params.get("studentId"));
            Optional<Subject> subject = this.subjectRepo.findById(params.get("subjectId"));

            StudentSubject studentSubject = new StudentSubject();
            studentSubject.setStudentId(student.get());
            studentSubject.setSubjectId(subject.get());

            StudentSubject studentSubject1 = this.studentSubjectRepository.save(studentSubject);

            StudentSubjectDto studentSubjectDto = new StudentSubjectDto();
            studentSubjectDto.setStudentId(student.get().getId());
            studentSubjectDto.setSubjectId(subject.get().getId());

            studentSubjects.add(studentSubjectDto);

        }


        return studentSubjects;
    }

    @Override
    public boolean deleteStudentSubject(int id) {
        this.studentSubjectRepository.deleteById(id);
        return true;
    }
    @Override
    public Optional<StudentSubject> getStudentSubjectByStudentAndSubjectId(String studentId, String subjectId) {
        return this.studentSubjectRepository.getStudentSubjectByStudentAndSubjectId(studentId, subjectId);
    }
}
