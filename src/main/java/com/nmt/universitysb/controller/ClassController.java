package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.Classes;
import com.nmt.universitysb.service.ClassesService;
import com.nmt.universitysb.service.FacultyService;
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
public class ClassController {

    @Autowired
    private ClassesService classesService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private Environment env;

    @GetMapping("/classes")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("classes", this.classesService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.classesService.countClasses();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));

        return "classes";
    }

    @GetMapping("/add_class")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_class", new Classes());
        model.addAttribute("faculty", this.facultyService.findAll());

        return "add_class";
    }

    @GetMapping("/update_class/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_class", this.classesService.findById(id));
        model.addAttribute("faculty", this.facultyService.findAll());
        return "update_class";
    }

    @PostMapping(value = "/add_class")
    public String add(@ModelAttribute(value = "add_class") Classes c,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.classesService.save(c);
            return "redirect:/classes";

        }

        return "add_class";
    }

    @PostMapping("/update_class")
    public String update(@ModelAttribute(value = "update_class") Classes c,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.classesService.save(c);
            return "redirect:/classes";
        }

        return "update_class";
    }
}
