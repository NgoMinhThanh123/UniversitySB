package com.nmt.universitysb.controller;
import com.nmt.universitysb.dto.StudentSubjectDto;
import com.nmt.universitysb.model.StudentSubject;
import com.nmt.universitysb.service.StudentSubjectService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Tag(name = "StudentSubject Controller")
@RestController
@RequestMapping("/api")
public class ApiStudentSubjectController {
    @Autowired
    private StudentSubjectService studentSubjectService;

    @DeleteMapping("/add_student_subject/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.studentSubjectService.deleteStudentSubject(id);
    }

    @GetMapping(path = "/get_student_subject/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Optional<StudentSubject>> getStudentSubject(
            @RequestParam String studentId,
            @RequestParam String subjectId) {
        Optional<StudentSubject> studentSubject = studentSubjectService.getStudentSubjectByStudentAndSubjectId(studentId, subjectId);
        if (studentSubject.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(studentSubject, HttpStatus.OK);
    }

    @PostMapping(path="/course-register/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<StudentSubjectDto>> courseRegister(@RequestBody List<Map<String, String>> paramsList) {
        List<StudentSubjectDto> studentSubjectDtos = this.studentSubjectService.courseRegister(paramsList);
        if (studentSubjectDtos == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(studentSubjectDtos, HttpStatus.CREATED);
    }
}
