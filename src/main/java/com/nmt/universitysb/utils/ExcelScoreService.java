//package com.nmt.universitysb.utils;
//
//import com.nmt.universitysb.dto.Score_ScoreValueDto;
//import com.nmt.universitysb.dto.SubjectDto;
//import com.nmt.universitysb.model.*;
//import com.nmt.universitysb.repository.*;
//import com.nmt.universitysb.service.ScoreColumnSevice;
//import com.nmt.universitysb.service.ScoreService;
//import org.apache.poi.ss.usermodel.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Optional;
//
//@Service
//public class ExcelScoreService {
//    @Autowired
//    private StudentRepository studentRepository;
//    @Autowired
//    private SubjectRepository subjectRepository;
//    @Autowired
//    private SemesterRepository semesterRepository;
//    @Autowired
//    private ScoreService scoreService;
//    @Autowired
//    private ScoreColumnRepository scoreColumnRepository;
//
//    public List<Score_ScoreValueDto> readScoreFromExcelFile(File file) {
//        List<Student> students = new ArrayList<>();
//        try {
//            FileInputStream excelFile = new FileInputStream(file);
//            Workbook workbook = WorkbookFactory.create(excelFile);
//            Sheet sheet = workbook.getSheetAt(0);
//            Iterator<Row> iterator = sheet.iterator();
//
//            while (iterator.hasNext()) {
//                Row currentRow = iterator.next();
//                if (currentRow.getRowNum() == 0 || currentRow.getRowNum() == 1|| currentRow.getRowNum() == 4) { // Bỏ qua dòng tiêu đề
//                    continue;
//                }
//                addScoreByExcel(String subjectId, String semesterId, String studentId, int scoreColumnId, double scoreValue) {
//
//               SubjectDto subject = subjectRepository.getSubjectByName(currentRow.getCell(1).getStringCellValue());
//               Optional<Semester> semester = semesterRepository.findById(currentRow.getCell(3).getStringCellValue());
//               String studentId = currentRow.getCell(0).getStringCellValue();
//               ScoreColumn scoreColumn = scoreColumnRepository.getScoreColumnByName(currentRow.getCell(4).getStringCellValue());
//
//
//               students.add(student);
//            }
//
//            workbook.close();
//            excelFile.close();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return students;
//    }
//}
