package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Semester;
import com.nmt.universitysb.service.SemesterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


@Controller
public class SemesterController {

    @Autowired
    private SemesterService semesterService;
    @Autowired
    private Environment env;

    @GetMapping("/semester")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("semester", this.semesterService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.semesterService.countSemesters();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "semester";
    }

    @GetMapping("/add_semester")
    public String addList(Model model) {
        model.addAttribute("add_semester", new Semester());

        return "add_semester";
    }

    @GetMapping("/update_semester/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_semester", this.semesterService.findById(id));
        return "update_semester";
    }

    @PostMapping(value = "/add_semester")
    public String add(@ModelAttribute(value = "add_semester") Semester m,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.semesterService.save(m);
            return "redirect:/semester";

        }

        return "add_semester";
    }

    @PostMapping("/update_semester")
    public String update(@ModelAttribute(value = "update_semester") Semester m,
            BindingResult rs) {

        if(!rs.hasErrors()){
            this.semesterService.save(m);
            return "redirect:/semester";

        }

        return "update_semester";
    }
}
