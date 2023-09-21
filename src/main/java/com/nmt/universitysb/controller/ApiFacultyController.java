package com.nmt.universitysb.controller;

import com.nmt.universitysb.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api")
public class ApiFacultyController {
    @Autowired
    private FacultyService facultyService;

    @DeleteMapping("/update_faculty/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.facultyService.deleteFaculty(id);
    }

//    @GetMapping("/faculties/")
//    @CrossOrigin
//    public ResponseEntity<List<Faculty>> list(@RequestParam Map<String, String> params) {
//        return new ResponseEntity<>(this.facultyService.getFaculties(params), HttpStatus.OK);
//    }

}
