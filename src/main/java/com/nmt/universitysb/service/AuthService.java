package com.nmt.universitysb.service;

import com.nmt.universitysb.dto.JwtResponse;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.requests.RegisterRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface AuthService {
    JwtResponse login(UserDetails userDetails);

}
