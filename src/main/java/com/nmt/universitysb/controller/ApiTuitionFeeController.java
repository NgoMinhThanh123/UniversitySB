package com.nmt.universitysb.controller;

import com.nmt.universitysb.service.TuitionFeeService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@Tag(name = "Tuition Fee Controller")
@RestController
@RequestMapping("/api")
public class ApiTuitionFeeController {
    @Autowired
    private TuitionFeeService tuitionFeeService;

    @DeleteMapping("/update_tuition_fee/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") String id) {
        this.tuitionFeeService.deleteTuitionFee(id);
    }
}
