package com.nmt.universitysb.controller;
import com.nmt.universitysb.dto.AccountDto;
import com.nmt.universitysb.dto.JwtResponse;
import com.nmt.universitysb.dto.UserDto;
import com.nmt.universitysb.exception.GoodNewsApiException;
import com.nmt.universitysb.model.User;
import com.nmt.universitysb.requests.LoginRequest;
import com.nmt.universitysb.service.AuthService;
import com.nmt.universitysb.service.UserService;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Tag(name = "User Controller")
@RestController
@RequestMapping("/api")
public class ApiUserController {
    @Autowired
    private UserService userService;
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private AuthService authService;

    @DeleteMapping("/update_user/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable(value = "id") int id) {
        this.userService.deleteUser(id);
    }

    @GetMapping("/users/")
    @CrossOrigin
    public ResponseEntity<List<User>> list() {
        return new ResponseEntity<>(this.userService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/users/{username}/")
    @CrossOrigin
    public ResponseEntity<UserDto> getUByUn(@PathVariable(value = "username") String username, Principal user) {
        return new ResponseEntity<>(this.userService.findByUsername(username), HttpStatus.OK);
    }


    @PostMapping("/login/")
    @CrossOrigin
    public ResponseEntity<?> login(@RequestBody @Valid final LoginRequest loginRequest) {
        try {
            authenticate(loginRequest.getUsername(), loginRequest.getPassword());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Username or password is invalid!");
        }

        final UserDetails userDetails = userService.loadUserByUsername(loginRequest.getUsername());
        JwtResponse jwtResponse = authService.login(userDetails);
        return ResponseEntity.ok().body(jwtResponse);
    }

    private void authenticate(final String username, final String password) throws Exception {
        Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
        SecurityContextHolder.getContext().setAuthentication(authentication);
    }

    @PostMapping(path = "/users/",
            consumes = {MediaType.MULTIPART_FORM_DATA_VALUE},
            produces = {MediaType.APPLICATION_JSON_VALUE})
    @CrossOrigin
    public ResponseEntity<Object> addUser(AccountDto accountDto, @RequestPart MultipartFile avatar) {
         try {
            User user = this.userService.addUser(accountDto, avatar);
            return new ResponseEntity<>(user, HttpStatus.CREATED);
        } catch (GoodNewsApiException ex) {
            return ResponseEntity.badRequest().body(ex.getMessage());
        }
   }

    @GetMapping(path = "/users-id/{id}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<User> getUserById(@PathVariable(value = "id")int id) {
        Optional<User> optionalUser = this.userService.findById(id);

        if (optionalUser.isPresent()) {
            User user = optionalUser.get();
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(path = "/current-user/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<User> details(Principal user) {
        User u = this.userService.getUserByUsername(user.getName());
        return new ResponseEntity<>(u, HttpStatus.OK);
    }
}
