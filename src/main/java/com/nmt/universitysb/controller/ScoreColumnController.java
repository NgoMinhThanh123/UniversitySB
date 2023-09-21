package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.ScoreColumn;
import com.nmt.universitysb.service.ScoreColumnSevice;
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
public class ScoreColumnController {
    @Autowired
    private ScoreColumnSevice scoreColumnSevice;
    @Autowired
    private Environment env;

    @GetMapping("/score_column")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("score_column", this.scoreColumnSevice.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.scoreColumnSevice.countScoreColumns();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
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
