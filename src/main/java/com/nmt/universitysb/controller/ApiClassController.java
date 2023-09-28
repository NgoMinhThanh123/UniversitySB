package com.nmt.universitysb.controller;
import java.util.List;
import java.util.Map;

import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author acer
 */
@RestController
@RequestMapping("/api")
public class ApiClassController {
    @Autowired
    private ClassesService classesService;

    @DeleteMapping("/update_class/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.classesService.deleteClasse(id);
    }

    @GetMapping("/classes/")
    @CrossOrigin
    public ResponseEntity<List<Classes>> list() {
        return new ResponseEntity<>(this.classesService.findAll(), HttpStatus.OK);
    }

}
