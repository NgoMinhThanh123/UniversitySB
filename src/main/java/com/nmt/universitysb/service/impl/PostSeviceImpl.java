package com.nmt.universitysb.service.impl;///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.nmt.universitymanage.service.impl;
//
//import com.nmt.model.Post;
//import com.nmt.model.User;
//import com.nmt.repository.PostRepository;
//import com.nmt.repository.UserRepository;
//import com.nmt.service.PostService;
//import com.nmt.universitymanage.model.Post;
//import com.nmt.universitymanage.model.User;
//import com.nmt.universitymanage.repository.PostRepository;
//import com.nmt.universitymanage.repository.UserRepository;
//import com.nmt.universitymanage.service.PostService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.stereotype.Service;
//
//import java.util.Date;
//import java.util.List;
//import java.util.Map;
//
///**
// *
// * @author acer
// */
//@Service
//public class PostSeviceImpl implements PostService {
//    @Autowired
//    private PostRepository postRepo;
//    @Autowired
//    private UserRepository userRepo;
//    @Override
//    public List<Post> getPosts(Map<String, String> params) {
//        return this.postRepo.getPosts(params);
//    }
//
//    @Override
//    public Post addPost(Post post) {
//        post.setPostTime(new Date());
//
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        User u = this.userRepo.getUserByUsername(authentication.getName());
//        post.setUserId(u);
//        return this.postRepo.addPost(post);
//    }
//
//    @Override
//    public Post getPostByid(int postId) {
//        return this.postRepo.getPostByid(postId);
//    }
//
//    @Override
//    public Boolean deletePost(int postId) {
//        return this.postRepo.deletePost(postId);
//    }
//
//}
