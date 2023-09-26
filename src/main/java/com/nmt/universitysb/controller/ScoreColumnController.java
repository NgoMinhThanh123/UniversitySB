package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.ScoreColumn;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.service.ScoreColumnSevice;
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
public class ScoreColumnController {
    @Autowired
    private ScoreColumnSevice scoreColumnSevice;
    @GetMapping("/score_column")
    public String list(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
                       @RequestParam(name = "kw", required = false) String keyword) {
        int pageSize = 12;
        Page<ScoreColumn> scoreColumnPage;

        if (keyword != null && !keyword.isEmpty()) {
            scoreColumnPage = this.scoreColumnSevice.findAllByNameContaining(keyword, PageRequest.of(page, pageSize));
        } else {
            scoreColumnPage = this.scoreColumnSevice.findAll(PageRequest.of(page, pageSize));
        }

        model.addAttribute("scoreColumnPage", scoreColumnPage);
        model.addAttribute("keyword", keyword);

        return "score_column";
    }

    @GetMapping("/add_score_column")
    public String addList(Model model) {
        model.addAttribute("add_score_column", new ScoreColumn());
        return "add_score_column";
    }

    @GetMapping("/update_score_column/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("update_score_column", this.scoreColumnSevice.findById(id));

        return "update_score_column";
    }

    @PostMapping("/add_score_column")
    public String add(@ModelAttribute(value = "add_score_column") ScoreColumn u,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.scoreColumnSevice.save(u);
            return "redirect:/score_column";

        }
        return "add_score_column";
    }
    @PostMapping("/update_score_column")
    public String update(@ModelAttribute(value = "update_score_column") ScoreColumn u,
                      BindingResult rs) {
        if(!rs.hasErrors()){
            this.scoreColumnSevice.save(u);
            return "redirect:/score_column";

        }
        return "update_score_column";
    }
}
