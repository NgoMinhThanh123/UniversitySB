package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.dto.*;
import com.nmt.universitysb.model.*;
import com.nmt.universitysb.repository.*;
import com.nmt.universitysb.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ScoreServiceImpl implements ScoreService {

    @Autowired
    private ScoreRepository scoreRepo;
    @Autowired
    private SubjectRepository subjectRepository;
    @Autowired
    private StudentRepository studetnRepository;
    @Autowired
    private SemesterRepository semesterRepository;
    @Autowired
    private ScoreColumnRepository scoreColumnRepository;
    @Autowired
    private ScoreValueRepository scoreValueRepository;
     @Autowired
    private StudentSubjectRepository studentSubjectRepository;

    @Override
    public List<Score> findAll() {
        return this.scoreRepo.findAll();
    }

    @Override
    public Page<Score> findAll(Pageable pageable) {
        return this.scoreRepo.findAll(pageable);
    }

    @Override
    public Optional<Score> findById(int id) {
        return this.scoreRepo.findById(id);
    }

    @Override
    public Page<Score> findAllByIdContaining(String keyword, Pageable pageable) {
        return this.scoreRepo.findAllByIdContaining(keyword, pageable);
    }

    @Override
    public Score save(Score f) {
        return this.scoreRepo.save(f);
    }

    @Override
    public boolean deleteScore(int id) {
        this.scoreRepo.deleteById(id);
        return true;
    }

    @Override
    public List<StudentScoreDTO> getStudentScores(String lecturerId, String semesterId, String subjectId) {
        return this.scoreRepo.getStudentScores(lecturerId, semesterId, subjectId);
    }

//    @Override
//    public List<StudentScoreDTO> getListScoresExport(String subjectId, String semesterId) {
//        return this.scoreRepo.getListScoresExport(semesterId, subjectId);
//    }
//
    @Override
    public List<ScoreDto> getScoreByStudentId(String studentId, String subjectId, String semesterId) {
        return this.scoreRepo.getScoreByStudentId(studentId, subjectId, semesterId);
    }

    @Override
    public List<ScoreListDto> getListScoreStudent(String studentId, String semesterId) {
        List<ScoreListDto> scoreListDtos = new ArrayList<>();
        List<SubjectDto> subjects = this.subjectRepository.getSubjectByStudentAndSemesterId(studentId, semesterId);
        Optional<Semester> semesters = this.semesterRepository.findById(semesterId);
        if (semesters.isPresent()) {
            Semester semester = semesters.get();
            String semesterName = semester.getName();
            int schoolYear = semester.getSchoolYear();

            for (int i = 0; i < subjects.size(); i++) {
                SubjectDto subject = subjects.get(i);
                List<ScoreDto> scoreDtos = this.scoreRepo.getScoreByStudentId(studentId, subject.getId(), semesterId);
                ScoreListDto scoreListDto = new ScoreListDto();
                scoreListDto.setScoreDto(scoreDtos);
                scoreListDto.setSubjectId(subject.getId());
                scoreListDto.setSubjectName(subject.getName());
                scoreListDto.setCredit(subject.getCredit());
                scoreListDto.setSemesterName(semesterName);
                scoreListDto.setSchoolYear(String.valueOf(schoolYear));
                scoreListDtos.add(scoreListDto);
            }
        }

        return scoreListDtos;
    }

    @Override
    public List<Score_ScoreValueDto> addScore(List<Map<String, String>> scoreParamsList) {
        List<Score_ScoreValueDto> scoreValueDtoList = new ArrayList<>();

        for (Map<String, String> params : scoreParamsList) {
            Optional<Subject> subject = this.subjectRepository.findById(params.get("subjectId"));
            Optional<Semester> semester = this.semesterRepository.findById(params.get("semesterId"));
            Optional<Student> student = this.studetnRepository.findById(params.get("studentId"));
            Optional<ScoreColumn> scoreColumn = this.scoreColumnRepository.findById(Integer.parseInt(params.get("scoreColumnId")));
            Optional<StudentSubject> studentSubject = this.studentSubjectRepository.getStudentSubjectByStudentAndSubjectId(student.get().getId(), subject.get().getId());

            Score score = new Score();
            score.setStudentSubjectId(studentSubject.get());
            score.setSemesterId(semester.get());

            Optional<Score> existingScore = scoreRepo.findByStudentSubjectIdAndSemesterId(
                    studentSubject.get().getId(),
                    semester.get().getId()
            );

            if (existingScore.isPresent()) {
                ScoreValue scoreValue = new ScoreValue();
                String scoreValueStr = params.get("scoreValue");
                if (scoreValueStr != null) {
                    scoreValue.setValue(Double.parseDouble(scoreValueStr));
                } else {
                    scoreValue.setValue(0.0);
                }
                scoreValue.setScoreColumnId(scoreColumn.get());
                scoreValue.setScoreId(existingScore.get());

                ScoreValue scoreValue1 = this.scoreValueRepository.save(scoreValue);

                Score_ScoreValueDto scoreValueDto = new Score_ScoreValueDto();

                scoreValueDto.setSubjectId(existingScore.get().getStudentSubjectId().getSubjectId().getId());
                scoreValueDto.setSemesterId(existingScore.get().getSemesterId().getId());
                scoreValueDto.setStudentId(existingScore.get().getStudentSubjectId().getStudentId().getId());
                scoreValueDto.setColumnId(scoreValue1.getScoreColumnId().getId());
                scoreValueDto.setValue(Double.parseDouble(String.valueOf(scoreValue1.getValue())));

                scoreValueDtoList.add(scoreValueDto);
            } else {
                Score score1 = this.scoreRepo.save(score);
                ScoreValue scoreValue = new ScoreValue();
                String scoreValueStr = params.get("scoreValue");
                if (scoreValueStr != null) {
                    scoreValue.setValue(Double.parseDouble(scoreValueStr));
                } else {
                    scoreValue.setValue(0.0);
                }
                scoreValue.setScoreColumnId(scoreColumn.get());
                scoreValue.setScoreId(score1);

                ScoreValue scoreValue1 = this.scoreValueRepository.save(scoreValue);

                Score_ScoreValueDto scoreValueDto = new Score_ScoreValueDto();

                scoreValueDto.setSubjectId(score1.getStudentSubjectId().getSubjectId().getId());
                scoreValueDto.setSemesterId(score1.getSemesterId().getId());
                scoreValueDto.setStudentId(score1.getStudentSubjectId().getStudentId().getId());
                scoreValueDto.setColumnId(scoreValue1.getScoreColumnId().getId());
                scoreValueDto.setValue(Double.parseDouble(String.valueOf(scoreValue1.getValue())));

                scoreValueDtoList.add(scoreValueDto);
            }

        }

        return scoreValueDtoList;
    }

}
