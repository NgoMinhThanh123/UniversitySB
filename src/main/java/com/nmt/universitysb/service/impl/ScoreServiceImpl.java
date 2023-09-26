package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.Score;
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

//    @Override
//    public List<Score> getScores(Map<String, String> params) {
//        return this.scoreRepo.getScores(params);
//    }
//
//    @Override
//    public boolean addOrUpdateScore(Score u) {
//        return this.scoreRepo.addOrUpdateScore(u);
//    }
//
//    @Override
//    public Score getScoreById(int id) {
//        return this.scoreRepo.getScoreById(id);
//    }
//
//    @Override
//    public boolean deleteScore(int id) {
//        return this.scoreRepo.deleteScore(id);
//    }
//
//    @Override
//    public int countScores() {
//        return this.scoreRepo.countScores();
//    }
//
//    @Override
//    public List<StudentScoreDTO> getStudentScores(String lecturerId, String semesterId, String subjectId) {
//        return this.scoreRepo.getStudentScores(lecturerId, semesterId, subjectId);
//    }
//
//    @Override
//    public List<StudentScoreDTO> getListScoresExport(String subjectId, String semesterId) {
//        return this.scoreRepo.getListScoresExport(semesterId, subjectId);
//    }
//
//    @Override
//    public List<ScoreDto> getScoreByStudentId(String studentId, String subjectId, String semesterId) {
//        return this.scoreRepo.getScoreByStudentId(studentId, subjectId, semesterId);
//    }
//
//    @Override
//    public List<ScoreListDto> getListScoreStudent(String studentId, String semesterId) {
//        List<ScoreListDto> scoreListDtos = new ArrayList<>();
//        List<Subject> subjects = this.subjectRepository.getSubjectByStudentAndSemesterId(studentId, semesterId);
//        Semester semesters = this.semesterRepository.getSemesterById(semesterId);
//        for (int i = 0; i < subjects.size(); i++) {
//            Subject subject = subjects.get(i);
//            List<ScoreDto> scoreDtos = this.scoreRepo.getScoreByStudentId(studentId, subject.getId(), semesterId);
//            ScoreListDto scoreListDto = new ScoreListDto();
//            scoreListDto.setScoreDto(scoreDtos);
//            scoreListDto.setSubjectId(subject.getId());
//            scoreListDto.setSubjectName(subject.getName());
//            scoreListDto.setCredit(subject.getCredit());
//            scoreListDto.setSemesterName(semesters.getName());
//            scoreListDto.setSchoolYear(String.valueOf(semesters.getSchoolYear()));
//            scoreListDtos.add(scoreListDto);
//        }
//
//        return scoreListDtos;
//    }
//
////    @Override
////    public Score_ScoreValueDto addScore(Map<String, String> params) {
////        Subject subject = this.subjectRepository.getSubjectById(params.get("subjectId"));
////        Semester semester = this.semesterRepository.getSemesterById(params.get("semesterId"));
////        Student student = this.studetnRepository.getStudentById(params.get("studentId"));
////        ScoreColumn scoreColumn = this.scoreColumnRepository.getScoreColumnById(Integer.parseInt(params.get("scoreColumnId")));
////        StudentSubject studentSubject = this.studentSubjectRepository.getStudentSubjectByStudentAndSubjectId(params.get("studentId"), params.get("subjectId"));
////
////        Score score = new Score();
////        score.setStudentSubjectId(studentSubject);
////        score.setSemesterId(semester);
////
////        Score score1 = this.scoreRepo.addScore(score);
////
////        ScoreValue scoreValue = new ScoreValue();
////        String scoreValueStr = params.get("scoreValue");
////        if (scoreValueStr != null) {
////            scoreValue.setValue(Double.parseDouble(scoreValueStr));
////        } else {
////            scoreValue.setValue(0.0);
////        }
////        scoreValue.setScoreColumnId(scoreColumn);
////        scoreValue.setScoreId(score1);
////
////        ScoreValue scoreValue1 = this.scoreValueRepository.addScoreValue(scoreValue);
////
////        Score_ScoreValueDto scoreValueDto = new Score_ScoreValueDto();
////
////        scoreValueDto.setSubjectId(score1.getStudentSubjectId().getSubjectId().toString());
////        scoreValueDto.setSemesterId(score1.getSemesterId().toString());
////        scoreValueDto.setStudentId(score1.getStudentSubjectId().getStudentId().toString());
////        scoreValueDto.setColumnId(scoreValue1.getScoreColumnId().getId());
////        scoreValueDto.setValue(Double.parseDouble(String.valueOf(scoreValue1.getValue())));
////
////        return scoreValueDto;
////    }
//
//    @Override
//    public List<Score_ScoreValueDto> addScore(List<Map<String, String>> scoreParamsList) {
//        List<Score_ScoreValueDto> scoreValueDtoList = new ArrayList<>();
//
//        for (Map<String, String> params : scoreParamsList) {
//            Subject subject = this.subjectRepository.getSubjectById(params.get("subjectId"));
//            Semester semester = this.semesterRepository.getSemesterById(params.get("semesterId"));
//            Student student = this.studetnRepository.getStudentById(params.get("studentId"));
//            ScoreColumn scoreColumn = this.scoreColumnRepository.getScoreColumnById(Integer.parseInt(params.get("scoreColumnId")));
//            StudentSubject studentSubject = this.studentSubjectRepository.getStudentSubjectByStudentAndSubjectId(student.getId(), subject.getId());
//
//            Score score = new Score();
//            score.setStudentSubjectId(studentSubject);
//            score.setSemesterId(semester);
//
//            Score score1 = this.scoreRepo.addScore(score);
//
//            ScoreValue scoreValue = new ScoreValue();
//            String scoreValueStr = params.get("scoreValue");
//            if (scoreValueStr != null) {
//                scoreValue.setValue(Double.parseDouble(scoreValueStr));
//            } else {
//                scoreValue.setValue(0.0);
//            }
//            scoreValue.setScoreColumnId(scoreColumn);
//            scoreValue.setScoreId(score1);
//
//            ScoreValue scoreValue1 = this.scoreValueRepository.addScoreValue(scoreValue);
//
//            Score_ScoreValueDto scoreValueDto = new Score_ScoreValueDto();
//
//            scoreValueDto.setSubjectId(score1.getStudentSubjectId().getSubjectId().toString());
//            scoreValueDto.setSemesterId(score1.getSemesterId().toString());
//            scoreValueDto.setStudentId(score1.getStudentSubjectId().getStudentId().toString());
//            scoreValueDto.setColumnId(scoreValue1.getScoreColumnId().getId());
//            scoreValueDto.setValue(Double.parseDouble(String.valueOf(scoreValue1.getValue())));
//
//            scoreValueDtoList.add(scoreValueDto);
//        }
//
//        return scoreValueDtoList;
//    }

}
