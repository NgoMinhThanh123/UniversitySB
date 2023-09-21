package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Integer> {
//    List<Comment> getComments(Map<String, String> params);
//    List<Comment> getCommentByPostId(int postId);
//    Comment addComment(Comment comment);
}
