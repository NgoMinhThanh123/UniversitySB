package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Faculty;
import com.nmt.universitysb.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

@Controller
public class FacultyController {

    @Autowired
    private FacultyService facultyService;
    @Autowired
    private Environment env;

    @GetMapping("/faculty")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("faculty", this.facultyService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.facultyService.countFaculties();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "faculty";
    }

    @GetMapping("/add_faculty")
    public String addList(Model model) {
        model.addAttribute("add_faculty", new Faculty());

        return "add_faculty";
    }

    @PostMapping(value = "/add_faculty")
    public String add(@ModelAttribute(value = "add_faculty") Faculty f,
                      BindingResult rs) {
        if (!rs.hasErrors()) {
            this.facultyService.save(f);
            return "redirect:/faculty";
        }

        return "add_faculty";
    }

    @GetMapping("/update_faculty/{id}")
    public String update(Model model, @PathVariable(value = "id") String id) {
        Optional<Faculty> faculty = this.facultyService.findById(id);
        if (faculty.isPresent()) {
            model.addAttribute("update_faculty", faculty.get());
        } else {
            System.out.println(faculty);
        }

        return "update_faculty";
    }

    @PostMapping("/update_faculty")
    public String update(@ModelAttribute(value = "update_faculty") Faculty f,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.facultyService.save(f);
            return "redirect:/faculty";
        }

        return "update_faculty";
    }

}
