package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Comment;
import com.nmt.universitysb.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {
    Optional<Comment> findById(int id);
    Comment save(Comment f);
    void deleteById(int id);
//    List<Comment> getComments(Map<String, String> params);
//    List<Comment> getCommentByPostId(int postId);
//    Comment addComment(Comment comment);
}
