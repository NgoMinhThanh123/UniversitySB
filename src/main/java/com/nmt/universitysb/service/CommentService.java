package com.nmt.universitysb.service;
import com.nmt.universitysb.model.Comment;
import com.nmt.universitysb.model.User;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface CommentService {
    List<Comment> findAll();
    Optional<Comment> findById(int id);
    Comment save(Comment f);

    boolean deleteUser(int id);
//    List<Comment> getComments(Map<String, String> params);
//    List<Comment> getCommentByPostId(int postId);
//    Comment addComment(Comment comment);
}
