package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.Subject;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.service.FacultyService;
import com.nmt.universitysb.service.SubjectService;
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
public class SubjectController {
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private FacultyService facultyService;
    @Autowired
    private Environment env;

    @GetMapping("/subject")
    public String list(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
                       @RequestParam(name = "kw", required = false) String keyword) {
        int pageSize = 12;
        Page<Subject> subjectPage;

        if (keyword != null && !keyword.isEmpty()) {
            subjectPage = this.subjectService.findAllByNameContaining(keyword, PageRequest.of(page, pageSize));
        } else {
            subjectPage = this.subjectService.findAll(PageRequest.of(page, pageSize));
        }

        model.addAttribute("subjectPage", subjectPage);
        model.addAttribute("keyword", keyword);

        return "subject";
    }

    @GetMapping("/add_subject")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_subject", new Subject());
        model.addAttribute("faculty", this.facultyService.findAll());

        return "add_subject";
    }

    @PostMapping(value = "/add_subject")
    public String add(@ModelAttribute(value = "add_lecturer") Subject s,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.subjectService.save(s);
            return "redirect:/subject";
        }

        return "add_subject";
    }

    @GetMapping("/update_subject/{id}")
    public String update(Model model, @PathVariable(value = "id") String id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_subject", this.subjectService.findById(id));
        model.addAttribute("faculty", this.facultyService.findAll());
        return "update_subject";
    }

    @PostMapping("/update_subject")
    public String update(@ModelAttribute(value = "update_subject") Subject s,
            BindingResult rs) {
        if(!rs.hasErrors()) {
            this.subjectService.save(s);
            return "redirect:/subject";
        }
        return "update_subject";
    }
}
