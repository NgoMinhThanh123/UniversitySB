package com.nmt.universitysb.controller;

import com.nmt.universitysb.model.Major;
import com.nmt.universitysb.service.FacultyService;
import com.nmt.universitysb.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

/**
 *
 * @author acer
 */
@Controller
public class MajorController {

    @Autowired
    private MajorService majorService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private Environment env;

    @GetMapping("/major")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("major", this.majorService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.majorService.countMajors();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "major";
    }

    @GetMapping("/add_major")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_major", new Major());
        model.addAttribute("faculty", this.facultyService.findAll());

        return "add_major";
    }

    @GetMapping("/update_major/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        Optional<Major> major = this.majorService.findById(id);
        if (major.isPresent()) {
            model.addAttribute("update_major", major);
        } else {
            System.out.println(major);
        }
        model.addAttribute("faculty", this.facultyService.findAll());
        return "update_major";
    }

    @PostMapping(value = "/add_major")
    public String add(@ModelAttribute(value = "add_major") Major m,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.majorService.save(m);
            return "redirect:/major";

        }

        return "add_major";
    }

    @PostMapping("/update_major")
    public String update(@ModelAttribute(value = "update_major") Major m, BindingResult rs) {

        if(!rs.hasErrors()){
            this.majorService.save(m);
            return "redirect:/major";

        }

        return "update_major";
    }

}
