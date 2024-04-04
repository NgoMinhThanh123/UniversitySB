package com.nmt.universitysb.controller;

import com.nmt.universitysb.dto.LecturerDto;
import com.nmt.universitysb.model.Lecturer;
import com.nmt.universitysb.service.LecturerService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name = "Lecturer Controller")
@RestController
@RequestMapping("/api")
public class ApiLecturerController {

    @Autowired
    private LecturerService lecturerService;

    @DeleteMapping("/update_lecturer/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.lecturerService.deleteLecturer(id);
    }

    @GetMapping("/lecturers/")
    @CrossOrigin
    public ResponseEntity<List<Lecturer>> list() {
        return new ResponseEntity<>(this.lecturerService.findAll(), HttpStatus.OK);
    }

    @GetMapping(path = "/lecturers-un/{username}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Lecturer> getStudentByUsename(@PathVariable(value = "username") String username) {
        Lecturer lecturerDto = lecturerService.getLecturerByUsername(username);
        if (lecturerDto == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(lecturerDto, HttpStatus.OK);
    }
}
