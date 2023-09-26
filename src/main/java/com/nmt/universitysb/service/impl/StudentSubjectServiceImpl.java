package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.StudentSubject;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.StudentSubjectRepository;
import com.nmt.universitysb.service.StudentSubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class StudentSubjectServiceImpl implements StudentSubjectService {
    @Autowired
    private StudentSubjectRepository studentSubjectRepository;

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
    public boolean deleteStudentSubject(int id) {
        this.studentSubjectRepository.deleteById(id);
        return true;
    }
//    @Override
//    public List<StudentSubject> getStudentSubjects(Map<String, String> params) {
//        return this.studentSubjectRepository.getStudentSubjects(params);
//    }
//
//    @Override
//    public StudentSubject getStudentSubjectById(int id) {
//        return this.studentSubjectRepository.getStudentSubjectById(id);
//    }
//
//    @Override
//    public boolean addOrUpdateStudentSubject(StudentSubject s) {
//        return this.studentSubjectRepository.addOrUpdateStudentSubject(s);
//    }
//
//    @Override
//    public boolean deleteStudentSubject(int id) {
//        return this.studentSubjectRepository.deleteStudentSubject(id);
//    }
//
//    @Override
//    public StudentSubject getStudentSubjectByStudentAndSubjectId(String studentId, String subjectId) {
//        return this.studentSubjectRepository.getStudentSubjectByStudentAndSubjectId(studentId, subjectId);
//    }
//
//    @Override
//    public int countStudentSubject() {
//        return this.studentSubjectRepository.countStudentSubject();
//    }
}
