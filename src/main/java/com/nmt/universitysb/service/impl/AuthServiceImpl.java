package com.nmt.universitysb.service.impl;
import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nmt.universitysb.dto.JwtResponse;
import com.nmt.universitysb.exception.GoodNewsApiException;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.UserRepository;
import com.nmt.universitysb.requests.RegisterRequest;
import com.nmt.universitysb.security.JwtTokenProvider;
import com.nmt.universitysb.service.AuthService;
import com.nmt.universitysb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class AuthServiceImpl implements AuthService {
    @Autowired
    private JwtTokenProvider tokenProvider;
    @Override
    public JwtResponse login(UserDetails userDetails) {
        JwtResponse jwtResponse = tokenProvider.generateToken(userDetails);
        return jwtResponse;
    }


}
