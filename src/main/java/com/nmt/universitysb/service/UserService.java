package com.nmt.universitysb.service;

import com.nmt.universitysb.model.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;
import java.util.Optional;

public interface UserService extends UserDetailsService{
    List<User> findAll();
    Optional<User> findById(int id);

    long count();
    User save(User f);

    boolean deleteUser(int id);
    User getUserByUsername(String username);
//    List<User> getUsers(Map<String, String> params);
//    int countUsers();
//    boolean addOrUpdateUser(User u);
//    User getUserById(int id);
//    boolean deleteUser(int id);
//    boolean authUser(String username, String password);
//    UserDto getUByUn(String username);
//    User getUserByUn(String username);
//    User getUserByEmail(String email);
//    User addUser(Map<String, String> params, MultipartFile avatar);
//    boolean isValidSchoolEmail(String email);
}
