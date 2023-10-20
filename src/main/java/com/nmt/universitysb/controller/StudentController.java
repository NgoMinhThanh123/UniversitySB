package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.service.*;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
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

    @GetMapping("/student")
    public String list(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
                       @RequestParam(name = "kw", required = false) String keyword) {
        int pageSize = 12;
        Page<Student> studentPage;

        if (keyword != null && !keyword.isEmpty()) {
            studentPage = this.studentService.findAllByNameContaining(keyword, PageRequest.of(page, pageSize));
        } else {
            studentPage = this.studentService.findAll(PageRequest.of(page, pageSize));
        }

        model.addAttribute("studentPage", studentPage);
        model.addAttribute("keyword", keyword);

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
    public String add(@ModelAttribute(value = "add_student") @Valid Student s,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.studentService.save(s);
            return "redirect:/student";

        }

        return "add_student";
    }

    @PostMapping("/update_student")
    public String update(@ModelAttribute(value = "update_student") @Valid Student s,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.studentService.save(s);
            return "redirect:/student";

        }

        return "update_student";
    }
}
