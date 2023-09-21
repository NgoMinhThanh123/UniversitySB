package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.service.MajorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiMajorController {
    @Autowired
    private MajorService majorService;

    @DeleteMapping("/update_major/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.majorService.deleteMajor(id);
    }

    @GetMapping("/majors/")
    @CrossOrigin
    public ResponseEntity<List<Major>> list(@RequestParam Map<String, String> params) {
        return new ResponseEntity<>(this.majorService.findAll(), HttpStatus.OK);
    }
}
