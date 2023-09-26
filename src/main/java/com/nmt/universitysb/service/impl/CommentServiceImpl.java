package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.Comment;
import com.nmt.universitysb.repository.CommentRepository;
import com.nmt.universitysb.repository.UserRepository;
import com.nmt.universitysb.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;


@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentRepository commentRepo;
    @Autowired
    private UserRepository userRepo;

    @Override
    public List<Comment> findAll() {
        return this.commentRepo.findAll();
    }

    @Override
    public Optional<Comment> findById(int id) {
        return this.commentRepo.findById(id);
    }

    @Override
    public Comment save(Comment f) {
        return this.commentRepo.save(f);
    }

    @Override
    public boolean deleteUser(int id) {
        this.commentRepo.deleteById(id);
        return true;
    }
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

}
