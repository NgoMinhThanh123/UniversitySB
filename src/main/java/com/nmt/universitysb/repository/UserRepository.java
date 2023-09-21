package com.nmt.universitysb.repository;

import com.nmt.universitysb.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    List<User> findAll();
    Optional<User> findById(int id);

    long count();
    User save(User f);
    void deleteById(int id);
//    List<User> getUsers(Map<String, String> params);
//    int countUsers();
//    boolean addOrUpdateUser(User u);
//    User getUserById(int id);
//    boolean deleteUser(int id);
//    User getUserByUsername(String username);
    @Query("select a from User a where a.username = :username")
    User getUserByUsername(@Param("username") String username);
//    User getUserByEmail(String email);
//    boolean authUser(String username, String password);
//    User addUser(User user);
//    boolean isValidSchoolEmail(String email);
}
