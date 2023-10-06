package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.dto.SubjectDto;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.repository.SubjectRepository;
import com.nmt.universitysb.service.SubjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    public Page<Subject> findAll(Pageable pageable) {
        return this.subjectRepo.findAll(pageable);
    }

    @Override
    public Optional<Subject> findById(String id) {
        return this.subjectRepo.findById(id);
    }

    @Override
    public Page<Subject> findAllByNameContaining(String keyword, Pageable pageable) {
        return this.subjectRepo.findAllByNameContaining(keyword, pageable);
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

    @Override
    public List<SubjectDto> getSubjectByLecturerId(String lecturerId) {
        return this.subjectRepo.getSubjectByLecturerId(lecturerId);
    }

    @Override
    public List<SubjectDto> getSubjectByStudentId(String studentId) {
        return this.subjectRepo.getSubjectByStudentId(studentId);
    }

    @Override
    public List<SubjectDto> getSubjectByFacultyId(String facultyId) {
        return this.subjectRepo.getSubjectByFacultyId(facultyId);
    }

    @Override
    public List<SubjectDto> getSubjectByStudentAndSemesterId(String studentId, String semesterId) {
        return this.subjectRepo.getSubjectByStudentAndSemesterId(studentId, semesterId);
    }

}