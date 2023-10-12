package com.nmt.universitysb.controller;
import java.util.List;
import java.util.Map;

import com.nmt.universitysb.dto.SubjectDto;
import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.service.SubjectService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "Subject Controller")
@RestController
@CrossOrigin
@RequestMapping("/api")
public class ApiSubjectController {
    @Autowired
    private SubjectService subjectService;

    @DeleteMapping("/update_subject/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.subjectService.deleteSubject(id);
    }

    @GetMapping("/subjects/")
    public ResponseEntity<List<Subject>> list() {
        return new ResponseEntity<>(this.subjectService.findAll(), HttpStatus.OK);
    }

    @GetMapping(path = "/subjects/{lecturerId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<SubjectDto>> getSubjectByLecturerId(@PathVariable(value = "lecturerId") String lecturerId) {
        List<SubjectDto> list = subjectService.getSubjectByLecturerId(lecturerId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/subjects/studentId/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<SubjectDto>> getSubjectByStudentId(@RequestParam String studentId) {
        List<SubjectDto> list = subjectService.getSubjectByStudentId(studentId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/subjects/semesterId/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<SubjectDto>> getSubjectBySemesterId(@RequestParam String semesterId) {
        List<SubjectDto> list = subjectService.getSubjectBySemesterId(semesterId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/subjects/facultyId/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<SubjectDto>> getSubjectByfacultyId(@RequestParam String facultyId, @RequestParam String semesterId) {
        List<SubjectDto> list = subjectService.getSubjectByFacultyId(facultyId, semesterId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

     @GetMapping(path = "/subjects/studentId-semesterId/", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<SubjectDto>> getSubjectByStudentAndSemesterId(
            @RequestParam String studentId,
            @RequestParam String semesterId) {
        List<SubjectDto> list = subjectService.getSubjectByStudentAndSemesterId(studentId, semesterId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

}
