package com.nmt.universitysb.controller;

import com.nmt.universitysb.service.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author acer
 */
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

//    @GetMapping("/lecturers/")
//    @CrossOrigin
//    public ResponseEntity<List<Lecturer>> list(@RequestParam Map<String, String> params) {
//        return new ResponseEntity<>(this.lecturerService.getLecturers(params), HttpStatus.OK);
//    }
//
//    @GetMapping(path = "/lecturers-un/{username}/", produces = MediaType.APPLICATION_JSON_VALUE)
//    @CrossOrigin
//    public ResponseEntity<LecturerDto> getStudentByUsename(@PathVariable(value = "username") String username) {
//        LecturerDto lecturerDto = lecturerService.getLecturerByUsername(username);
//        if (lecturerDto == null) {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//        return new ResponseEntity<>(lecturerDto, HttpStatus.OK);
//    }
}
