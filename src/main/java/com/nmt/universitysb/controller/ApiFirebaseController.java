package com.nmt.universitysb.controller;

import com.nmt.universitysb.dto.FirebaseProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/firebase")
public class ApiFirebaseController {
    @Autowired
    private FirebaseProperties firebaseProperties;

    @Autowired
    public ApiFirebaseController(FirebaseProperties firebaseProperties) {
        this.firebaseProperties = firebaseProperties;
    }

    @GetMapping("/config")
    public FirebaseProperties getFirebaseConfig() {
        return firebaseProperties;
    }
}
