package com.nmt.universitysb.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.repository.StudentRepository;
import com.nmt.universitysb.repository.UserRepository;
import com.nmt.universitysb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Optional;
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
    public Optional<User> findById(int id) {
        return this.userRepo.findById(id);
    }

    @Override
    public long count() {
        return this.userRepo.count();
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
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }


//    @Override
//    public List<User> getUsers(Map<String, String> params) {
//        return this.userRepo.getUsers(params);
//    }
//
//    @Override
//    public boolean addOrUpdateUser(User u) {
//
//        if (!u.getFile().isEmpty()) {
//            try {
//                Map res = this.cloudinary.uploader().upload(u.getFile().getBytes(), ObjectUtils.asMap("resource_type", "auto"));
//                u.setAvatar(res.get("secure_url").toString());
//                u.setPassword(encoder.encode(u.getPassword()));
//
//            } catch (IOException ex) {
//                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return this.userRepo.addOrUpdateUser(u);
//    }
//
//    @Override
//    public User getUserById(int id) {
//        return this.userRepo.getUserById(id);
//    }
//
//    @Override
//    public boolean deleteUser(int id) {
//        return this.userRepo.deleteUser(id);
//    }
//
//    @Override
//    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//        User u = this.userRepo.getUserByUsername(username);
//        if (u == null) {
//            throw new UsernameNotFoundException("Invalid user!");
//        }
//
//        Set<GrantedAuthority> authorities = new HashSet<>();
//        authorities.add(new SimpleGrantedAuthority(u.getRole()));
//
//        return new org.springframework.security.core.userdetails.User(
//                u.getUsername(), u.getPassword(), authorities);
//    }
//
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
//    @Override
//    public User addUser(Map<String, String> params, MultipartFile avatar) {
//        if(this.getUserByUn(params.get("username")) != null){
//            throw new UserException(HttpStatus.BAD_REQUEST, "Tên tài khoản đã tồn tại");
//        }
//        if(this.getUserByEmail(params.get("email")) != null){
//            throw new UserException(HttpStatus.BAD_REQUEST, "Email đã tồn tại");
//        }
//        if(!this.isValidSchoolEmail(params.get("email"))){
//            throw new UserException(HttpStatus.BAD_REQUEST, "Email không đúng định dạng");
//        }
//        User u = new User();
//        u.setEmail(params.get("email"));
//        u.setUsername(params.get("username"));
//        u.setPassword(this.encoder.encode(params.get("password")));
//        u.setRole("ROLE_SINHVIEN");
//        if (!avatar.isEmpty()) {
//            try {
//                Map res = this.cloudinary.uploader().upload(avatar.getBytes(),
//                        ObjectUtils.asMap("resource_type", "auto"));
//                u.setAvatar(res.get("secure_url").toString());
//            } catch (IOException ex) {
//                Logger.getLogger(UserServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//
//        this.userRepo.addUser(u);
//        return u;
//    }
//
//    @Override
//    public boolean isValidSchoolEmail(String email) {
//        return this.userRepo.isValidSchoolEmail(email);
//    }
//
//    @Override
//    public User getUserByEmail(String email) {
//        return this.userRepo.getUserByEmail(email);
//    }
//
//    @Override
//    public int countUsers() {
//        return this.userRepo.countUsers();
//    }

}
