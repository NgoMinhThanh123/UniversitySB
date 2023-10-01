package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.dto.ScoreDto;
import com.nmt.universitysb.dto.StuScoreDto;
import com.nmt.universitysb.dto.StudentDto;
import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.repository.ScoreRepository;
import com.nmt.universitysb.repository.StudentRepository;
import com.nmt.universitysb.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepo;
        @Autowired
    private ScoreRepository scoreRepo;

    @Override
    public List<Student> findAll() {
        return this.studentRepo.findAll();
    }

    @Override
    public Page<Student> findAll(Pageable pageable) {
        return this.studentRepo.findAll(pageable);
    }

    @Override
    public Optional<Student> findById(String id) {
        return this.studentRepo.findById(id);
    }

    @Override
    public Page<Student> findAllByNameContaining(String keyword, Pageable pageable) {
        return this.studentRepo.findAllByNameContaining(keyword, pageable);
    }

    @Override
    public Student save(Student f) {
        return this.studentRepo.save(f);
    }

    @Override
    public boolean deleteStudent(String id) {
        this.studentRepo.deleteById(id);
        return true;
    }

    @Override
    public StudentDto getStudentByUsername(String username) {
        Student u = this.studentRepo.getStudentByUsername(username);
        StudentDto studentDto = new StudentDto();
        studentDto.setId(u.getId());
        studentDto.setName(u.getName());
        studentDto.setBirthday(u.getBirthday());
        studentDto.setGender(u.getGender());
        studentDto.setPhone(u.getPhone());
        studentDto.setAddress(u.getAddress());
        studentDto.setClassesId(u.getClassesId());
        studentDto.setFacultyId(u.getFacultyId());
        studentDto.setMajorId(u.getMajorId());

        return studentDto;
    }

    @Override
    public List<StuScoreDto> getListStudent(String lectureId, String subjectId, String semesterId) {
        List<Student> students = this.studentRepo.getListStudent(lectureId, subjectId, semesterId);
        List<StuScoreDto> stuScoreDtos = new ArrayList<>();
        for(int i = 0; i < students.size(); i++){
            Student student = students.get(i);
            StuScoreDto stuScoreDto = new StuScoreDto();
            List<ScoreDto> scoreDtos = this.scoreRepo.getScoreByStudentId(student.getId(), subjectId, semesterId);

            stuScoreDto.setStudentId(student.getId());
            stuScoreDto.setStudentName(student.getName());
            stuScoreDto.setStudentBirthday(student.getBirthday());
            stuScoreDto.setScoreDto(scoreDtos);
            stuScoreDtos.add(stuScoreDto);
        }

        return stuScoreDtos;
    }


    @Override
    public List<String> getAllMailOfStudent(String lecturerId, String subjectId, String semesterId) {
        return this.studentRepo.getAllMailOfStudent(lecturerId, subjectId, semesterId);
    }

    @Override
    public List<StudentDto> getStudentByHomeroomTeacher(String lecturerId) {
        return this.studentRepo.getStudentByHomeroomTeacher(lecturerId);
    }

}
