package com.nmt.universitysb.service.impl;///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package com.nmt.universitymanage.service.impl;
//import com.nmt.universitymanage.model.Comment;
//import com.nmt.universitymanage.model.User;
//import com.nmt.universitymanage.repository.CommentRepository;
//import com.nmt.universitymanage.repository.UserRepository;
//import com.nmt.universitymanage.service.CommentService;
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
//public class CommentServiceImpl implements CommentService {
//
//    @Autowired
//    private CommentRepository commentRepo;
//    @Autowired
//    private UserRepository userRepo;
//    @Override
//    public List<Comment> getComments(Map<String, String> params) {
//        return this.commentRepo.getComments(params);
//    }
//
//    @Override
//    public List<Comment> getCommentByPostId(int postId) {
//        return this.commentRepo.getCommentByPostId(postId);
//    }
//
//    @Override
//    public Comment addComment(Comment comment) {
//        comment.setDateCreated(new Date());
//
//        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//        User u = this.userRepo.getUserByUsername(authentication.getName());
//        comment.setUserId(u);
//
//        return this.commentRepo.addComment(comment);
//    }
//
//}
