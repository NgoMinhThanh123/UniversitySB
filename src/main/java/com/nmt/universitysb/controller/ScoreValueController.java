package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.ScoreValue;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.service.ScoreColumnSevice;
import com.nmt.universitysb.service.ScoreService;
import com.nmt.universitysb.service.ScoreValueService;
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
public class ScoreValueController {

    @Autowired
    private ScoreValueService scoreValueService;
    @Autowired
    private ScoreService scoreService;
    @Autowired
    private ScoreColumnSevice scoreColumnSevice;

    @GetMapping("/score_value")
    public String list(Model model, @RequestParam(name = "page", defaultValue = "0") int page,
                       @RequestParam(name = "kw", required = false) String keyword) {
        int pageSize = 12;
        Page<ScoreValue> scoreValuePage;

        if (keyword != null) {
            scoreValuePage = this.scoreValueService.findAllByIdContaining(keyword, PageRequest.of(page, pageSize));
        } else {
            scoreValuePage = this.scoreValueService.findAll(PageRequest.of(page, pageSize));
        }

        model.addAttribute("scoreValuePage", scoreValuePage);
        model.addAttribute("keyword", keyword);

        return "score_value";
    }

    @GetMapping("/add_score_value")
    public String addList(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("add_score_value", new ScoreValue());
        model.addAttribute("score", this.scoreService.findAll());
        model.addAttribute("score_column", this.scoreColumnSevice.findAll());

        return "add_score_value";
    }

    @GetMapping("/update_score_value/{id}")
    public String update(Model model, @PathVariable(value = "id") int id, @RequestParam Map<String, String> params) {
        model.addAttribute("update_score_value", this.scoreValueService.findById(id));
        model.addAttribute("score", this.scoreService.findAll());
        model.addAttribute("score_column", this.scoreColumnSevice.findAll());

        return "update_score_value";
    }

    @PostMapping("/add_score_value")
    public String add(@ModelAttribute(value = "add_score_value")ScoreValue u,
            BindingResult rs) {
        if (!rs.hasErrors()) {
            this.scoreValueService.save(u);
            return "redirect:/score_value";

        }
        return "add_score_value";
    }

    @PostMapping("/update_score_value")
    public String update(@ModelAttribute(value = "update_score_value")ScoreValue u,
                      BindingResult rs) {
        if (!rs.hasErrors()) {
            this.scoreValueService.save(u);
            return "redirect:/score_value";

        }
        return "update_score_value";
    }
}
