package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Post;
import com.nmt.universitysb.model.Student;
import com.nmt.universitysb.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
    Optional<Post> findById(int id);
    Page<Post> findAllByTitleContaining(String keyword, Pageable pageable);
    Post save(Post f);
    void deleteById(int id);
//    List<Post> getPosts(Map<String, String> params);
//    Post addPost(Post post);
//    Post getPostByid(int id);
//    Boolean deletePost(int id);
}
