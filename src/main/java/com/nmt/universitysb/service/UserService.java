package com.nmt.universitysb.service;

import com.nmt.universitysb.dto.UserDto;
import com.nmt.universitysb.model.Faculty;
import com.nmt.universitysb.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface UserService extends UserDetailsService{
    List<User> findAll();
    Page<User> findAll(Pageable pageable);
    Optional<User> findById(int id);
    UserDto findByUsername(String username);

    User save(User f);

    boolean deleteUser(int id);
    User getUserByUsername(String username);
    Page<User> findAllByUsernameContaining(String keyword, Pageable pageable);

    User addUser(Map<String, String> params, MultipartFile avatar);
//    boolean addOrUpdateUser(User u);
//    User getUserById(int id);
//    boolean deleteUser(int id);
//    boolean authUser(String username, String password);
//    UserDto getUByUn(String username);
//    User getUserByUn(String username);
//    User getUserByEmail(String email);
    boolean isValidSchoolEmail(String email);
}
