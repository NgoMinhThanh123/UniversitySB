package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.service.SemesterService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Semester Controller")
@RestController
@RequestMapping("/api")
public class ApiSemesterController {
    @Autowired
    private SemesterService semesterService;

    @DeleteMapping("/update_semester/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.semesterService.deleteSemester(id);
    }


    @GetMapping("/get-semesters/")
    @CrossOrigin
    public ResponseEntity<List<Semester>> getList() {
        List<Semester> list = this.semesterService.findAll();
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping("/semesters/")
    @CrossOrigin
    public ResponseEntity<List<Semester>> list(@RequestParam String lecturerId) {
        List<Semester> list = this.semesterService.getSemesterByLecturerId(lecturerId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @GetMapping("/semesters/student/")
    @CrossOrigin
    public ResponseEntity<List<Semester>> getListSemesterByStudentId( @RequestParam String studentId) {
        List<Semester> list = this.semesterService.getSemesterByStudentId(studentId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
}
