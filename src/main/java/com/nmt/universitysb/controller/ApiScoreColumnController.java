package com.nmt.universitysb.controller;
import com.nmt.universitysb.service.ScoreColumnSevice;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "ScoreColumn Controller")
@RestController
@RequestMapping("/api")
public class ApiScoreColumnController {
    @Autowired
    private ScoreColumnSevice scoreColumnSevice;

    @DeleteMapping("/delete_score_column/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.scoreColumnSevice.deleteScoreColumn(id);
    }
}
