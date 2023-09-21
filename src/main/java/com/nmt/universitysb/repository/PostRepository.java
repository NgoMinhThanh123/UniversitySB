package com.nmt.universitysb.repository;
import com.nmt.universitysb.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {
//    List<Post> getPosts(Map<String, String> params);
//    Post addPost(Post post);
//    Post getPostByid(int id);
//    Boolean deletePost(int id);
}
