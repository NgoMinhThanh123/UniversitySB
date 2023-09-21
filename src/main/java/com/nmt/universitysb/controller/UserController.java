package com.nmt.universitysb.controller;
import java.util.Map;

import com.nmt.universitysb.model.User;
import com.nmt.universitysb.service.UserService;
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
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private Environment env;

//    @GetMapping("/login")
//    public String login() {
//        return "login";
//    }
    @GetMapping("/user")
    public String list(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("user", this.userService.findAll());
//        int pageSize = Integer.parseInt(this.env.getProperty("PAGE_SIZE"));
//        int count = this.userService.countUsers();
//        model.addAttribute("counter", Math.ceil(count * 1.0 / pageSize));
        return "user";
    }

    @GetMapping("/add_user")
    public String addList(Model model) {
        model.addAttribute("add_user", new User());

        return "add_user";
    }

    @GetMapping("/update_user/{id}")
    public String update(Model model, @PathVariable(value = "id") int id) {
        model.addAttribute("update_user", this.userService.findById(id));

        return "update_user";
    }

    @PostMapping("/add_user")
    public String add(@ModelAttribute(value = "add_user")User u,
            BindingResult rs) {
        if(!rs.hasErrors()){
            this.userService.save(u);
            return "redirect:/user";

        }
        return "add_user";
    }
    @PostMapping("/update_user")
    public String update(@ModelAttribute(value = "update_user")User u,
                      BindingResult rs) {
        if(!rs.hasErrors()){
            this.userService.save(u);
            return "redirect:/user";

        }
        return "update_user";
    }
}
