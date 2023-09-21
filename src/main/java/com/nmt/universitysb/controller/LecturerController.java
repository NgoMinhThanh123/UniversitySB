package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Lecturer;
import com.nmt.universitysb.service.ClassesService;
import com.nmt.universitysb.service.FacultyService;
import com.nmt.universitysb.service.LecturerService;
import com.nmt.universitysb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@ControllerAdvice
@Controller
public class LecturerController {

    @Autowired
    private LecturerService lecturerService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private ClassesService classesService;
    @Autowired
    private UserService userService;
    @Autowired
    private Environment env;

    @GetMapping("/lecturer")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("lecturer", this.lecturerService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.lecturerService.countLecturers();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "lecturer";
    }

    @GetMapping("/add_lecturer")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_lecturer", new Lecturer());
        model.addAttribute("faculty", this.facultyService.findAll());
        model.addAttribute("user", this.userService.findAll());
        model.addAttribute("class", this.classesService.findAll());

        return "add_lecturer";
    }

    @PostMapping(value = "/add_lecturer")
    public String add(@ModelAttribute(value = "add_lecturer") Lecturer l,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.lecturerService.save(l);
            return "redirect:/lecturer";

        }
        return "add_lecturer";
    }

    @GetMapping("/update_lecturer/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_lecturer", this.lecturerService.findById(id));
        model.addAttribute("faculty", this.facultyService.findAll());
        model.addAttribute("user", this.userService.findAll());
        model.addAttribute("class", this.classesService.findAll());
        return "update_lecturer";
    }

    @PostMapping("/update_lecturer")
    public String update(@ModelAttribute(value = "update_lecturer") Lecturer l,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.lecturerService.save(l);
            return "redirect:/lecturer";
        }

        return "update_lecturer";
    }
}
