package com.nmt.universitysb.controller;
import com.nmt.universitysb.service.ScoreValueService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@Tag(name = "ScoreValue Controller")
@RestController
@RequestMapping("/api")
public class ApiScoreValueController {
    @Autowired
    private ScoreValueService scoreValueService;

    @DeleteMapping("/add_score_value/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.scoreValueService.deleteScoreValue(id);
    }
}
