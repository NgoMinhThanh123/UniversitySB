package com.nmt.universitysb.controller;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import com.nmt.universitysb.dto.ScoreDto;
import com.nmt.universitysb.dto.ScoreListDto;
import com.nmt.universitysb.dto.Score_ScoreValueDto;
import com.nmt.universitysb.dto.StudentScoreDTO;
import com.nmt.universitysb.service.ScoreService;
import com.nmt.universitysb.utils.ExcelUtils;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "Score Controller")
@RestController
@RequestMapping("/api")
public class ApiScoreController {

    @Autowired
    private ScoreService scoreService;

    @DeleteMapping("/add_score/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.scoreService.deleteScore(id);
    }

    @GetMapping(path = "/scores/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<StudentScoreDTO>> getScoresById(
            @RequestParam String lecturerId,
            @RequestParam String semesterId,
            @RequestParam String subjectId) {
        List<StudentScoreDTO> list = scoreService.getStudentScores(lecturerId, semesterId, subjectId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/scores/student-id/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<ScoreDto>> getScoresByStudentId(
            @RequestParam String studentId,
            @RequestParam String subjectId,
            @RequestParam String semesterId) {
        List<ScoreDto> list = scoreService.getScoreByStudentId(studentId, subjectId, semesterId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/scores/list/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<ScoreListDto>> scoresList(
            @RequestParam String studentId,
            @RequestParam String semesterId) {
        List<ScoreListDto> list = scoreService.getListScoreStudent(studentId, semesterId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/scores/export-excel/")
    @CrossOrigin
    public void exportExcel(
            @RequestParam String lecturerId,
            @RequestParam String semesterId,
            @RequestParam String subjectId,
            HttpServletResponse response) {
        try {
            List<StudentScoreDTO> list = scoreService.getStudentScores(lecturerId, semesterId, subjectId);

            String templatePath = "D:/template.xlsx"; // Đường dẫn đến tệp mẫu Excel tùy chỉnh
            String outputFilePath = "D:/student_scores_custom.xlsx"; // Đường dẫn đến tệp Excel đầu ra sau khi điền dữ liệu

            ExcelUtils excelExporter = new ExcelUtils();
            excelExporter.exportToCustomExcel(list, outputFilePath);

            // Đọc tệp Excel đầu ra và trả về cho người dùng để tải xuống
            File excelFile = new File(outputFilePath);
            try (FileInputStream fileInputStream = new FileInputStream(excelFile)) {
                response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
                response.setHeader("Content-Disposition", "attachment; filename=student_scores_custom.xlsx");
                OutputStream outputStream = response.getOutputStream();

                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                outputStream.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
            // Xử lý ngoại lệ
        }
    }

    @PostMapping(path="/add-score/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<Score_ScoreValueDto>> addScore(@RequestBody List<Map<String, String>> scoreParamsList) {
        List<Score_ScoreValueDto> scoreValueDtos = this.scoreService.addScore(scoreParamsList);
        if (scoreValueDtos == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(scoreValueDtos, HttpStatus.CREATED);
    }

}
