package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.repository.SubjectRepository;
import com.nmt.universitysb.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;


@Service
public class SubjectServiceImpl implements SubjectService {

    @Autowired
    private SubjectRepository subjectRepo;

    @Override
    public List<Subject> findAll() {
        return this.subjectRepo.findAll();
    }

    @Override
    public Optional<Subject> findById(String id) {
        return this.subjectRepo.findById(id);
    }

    @Override
    public long count() {
        return this.subjectRepo.count();
    }

    @Override
    public Subject save(Subject f) {
        return this.subjectRepo.save(f);
    }

    @Override
    public boolean deleteSubject(String id) {
        this.subjectRepo.deleteById(id);
        return true;
    }

//    @Override
//    public List<Subject> getSubjects(Map<String, String> params) {
//        return this.subjectRepo.getSubjects(params);
//    }
//
//    @Override
//    public boolean addSubject(Subject c) {
//        return this.subjectRepo.addSubject(c);
//    }
//
//    @Override
//    public boolean updateSubject(Subject c) {
//        return this.subjectRepo.updateSubject(c);
//    }
//
//    @Override
//    public Subject getSubjectById(String id) {
//        return this.subjectRepo.getSubjectById(id);
//    }
//
//    @Override
//    public boolean deleteSubject(String id) {
//        return this.subjectRepo.deleteSubject(id);
//    }
//
//    @Override
//    public int countSubjects() {
//        return this.subjectRepo.countSubjects();
//    }
//
//    @Override
//    public List<Subject> getSubjectByLecturerId(String lecturerId) {
//        return this.subjectRepo.getSubjectByLecturerId(lecturerId);
//    }
//
//    @Override
//    public List<Subject> getSubjectByStudentId(String studentId) {
//        return this.subjectRepo.getSubjectByStudentId(studentId);
//    }
//
//    @Override
//    public List<Subject> getSubjectByStudentAndSemesterId(String studentId, String semesterId) {
//        return this.subjectRepo.getSubjectByStudentAndSemesterId(studentId, semesterId);
//    }

}
