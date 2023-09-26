package com.nmt.universitysb.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nmt.universitysb.dto.UserDto;
import com.nmt.universitysb.exception.GoodNewsApiException;
import com.nmt.universitysb.model.Faculty;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.StudentRepository;
import com.nmt.universitysb.repository.UserRepository;
import com.nmt.universitysb.requests.RegisterRequest;
import com.nmt.universitysb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service("userDetailsService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepo;
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public List<User> findAll() {
        return this.userRepo.findAll();
    }

    @Override
    public Page<User> findAll(Pageable pageable) {
        return this.userRepo.findAll(pageable);
    }

    @Override
    public Optional<User> findById(int id) {
        return this.userRepo.findById(id);
    }

    @Override
    public UserDto findByUsername(String username) {
        User u = this.userRepo.getUserByUsername(username);
        UserDto userDto = new UserDto();
        userDto.setUsername(u.getUsername());
        userDto.setPassword(u.getPassword());
        userDto.setEmail(u.getEmail());
        userDto.setRole(u.getRole());

        return userDto;
    }

    @Override
    public User save(User f) {
        if (!f.getFile().isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(f.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
                f.setAvatar(res.get("secure_url").toString());
                f.setPassword(encoder.encode(f.getPassword()));

            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return this.userRepo.save(f);
    }

    @Override
    public boolean deleteUser(int id) {
        this.userRepo.deleteById(id);
        return true;
    }

    @Override
    public User getUserByUsername(String username) {
        return this.userRepo.getUserByUsername(username);
    }

    @Override
    public Page<User> findAllByUsernameContaining(String keyword, Pageable pageable) {
        return this.userRepo.findAllByUsernameContaining(keyword, pageable);
    }


    @Override
    public boolean isValidSchoolEmail(String email) {
        String schoolDomain = "ou.edu.vn";
        return email.endsWith("@" + schoolDomain);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User u = this.userRepo.getUserByUsername(username);
        if (u == null) {
            throw new UsernameNotFoundException("Invalid user!");
        }

        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRole()));

        return new org.springframework.security.core.userdetails.User(
                u.getUsername(), u.getPassword(), authorities);
    }



//    @Override
//    public boolean authUser(String username, String password) {
//        return this.userRepo.authUser(username, password);
//    }
//
//    @Override
//    public UserDto getUByUn(String username) {
//        User u = this.userRepo.getUserByUsername(username);
//        UserDto userDto = new UserDto();
//        userDto.setUsername(u.getUsername());
//        userDto.setPassword(u.getPassword());
//        userDto.setEmail(u.getEmail());
//        userDto.setRole(u.getRole());
//
//        return userDto;
//
//    }
//
//    @Override
//    public User getUserByUn(String username) {
//        return this.userRepo.getUserByUsername(username);
//    }
//
    @Override
    public User addUser(Map<String, String> params, MultipartFile avatar) {
        if(this.getUserByUsername(params.get("username")) != null){
            throw new GoodNewsApiException(HttpStatus.BAD_REQUEST, "Tên tài khoản đã tồn tại");
        }
        if(this.userRepo.getUserByEmail(params.get("email")) != null){
            throw new GoodNewsApiException(HttpStatus.BAD_REQUEST, "Email đã tồn tại");
        }
        if(!this.isValidSchoolEmail(params.get("email"))){
            throw new GoodNewsApiException(HttpStatus.BAD_REQUEST, "Email không đúng định dạng");
        }
        User u = new User();
        u.setEmail(params.get("email"));
        u.setUsername(params.get("username"));
        u.setPassword(this.encoder.encode(params.get("password")));
        u.setRole("ROLE_SINHVIEN");
        if (!avatar.isEmpty()) {
            try {
                Map res = this.cloudinary.uploader().upload(avatar.getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                u.setAvatar(res.get("secure_url").toString());
            } catch (IOException ex) {
                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        this.userRepo.save(u);
        return u;
    }

}
