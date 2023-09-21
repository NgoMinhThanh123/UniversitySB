package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentController {

    @Autowired
    StudentService studentService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private UserService userService;
    @Autowired
    private ClassesService classesService;
    @Autowired
    private Environment env;

    @GetMapping("/student")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("student", this.studentService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        long count = this.studentService.count();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "student";
    }

    @GetMapping("/add_student")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_student", new Student());
        model.addAttribute("user", this.userService.findAll());
        model.addAttribute("classes", this.classesService.findAll());
        model.addAttribute("faculty", this.facultyService.findAll());
        model.addAttribute("major", this.majorService.findAll());

        return "add_student";
    }

    @GetMapping("/update_student/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_student", this.studentService.findById(id));
        model.addAttribute("user", this.userService.findAll());
        model.addAttribute("classes", this.classesService.findAll());
        model.addAttribute("faculty", this.facultyService.findAll());
        model.addAttribute("major", this.majorService.findAll());
        return "update_student";
    }

    @PostMapping(value = "/add_student")
    public String add(@ModelAttribute(value = "add_student") Student s,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.studentService.save(s);
            return "redirect:/student";

        }

        return "add_student";
    }

    @PostMapping("/update_student")
    public String update(@ModelAttribute(value = "update_student")Student s,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.studentService.save(s);
            return "redirect:/student";

        }

        return "update_student";
    }
}
