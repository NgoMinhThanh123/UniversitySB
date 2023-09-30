package com.nmt.universitysb.controller;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.nmt.universitysb.model.Comment;
import com.nmt.universitysb.model.Post;
import com.nmt.universitysb.service.CommentService;
import com.nmt.universitysb.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author acer
 */
@RestController
@RequestMapping("/api")
public class ApiPostController {
    @Autowired
    private PostService postService;

     @Autowired
    private CommentService commentService;

    @GetMapping("/posts/")
    @CrossOrigin
    public ResponseEntity<List<Post>> list(@RequestParam(required = false) String kw, Pageable pageable) {
        Page<Post> page;
        if (kw != null && !kw.isEmpty()) {
            page = postService.findAllByTitleContaining(kw, pageable);
        } else {
            page = postService.findAll(pageable);
        }

        List<Post> list = page.getContent();

        if (list.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @GetMapping(path = "/posts/{postId}/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Post> getPostById(@PathVariable(value = "postId") int postId) {
        Optional<Post> post = postService.findById(postId);
        if (post.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(post.get(), HttpStatus.OK);
    }

    @GetMapping(path = "/posts/{postId}/comments/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<Comment>> getCommentByPostId(@PathVariable(value = "postId") int postId) {
        List<Comment> list = commentService.getCommentByPostId(postId);
        if (list.isEmpty()) {
            return new ResponseEntity<>(list, HttpStatus.OK);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

    @PostMapping(path="/add-post/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Post> addPost(@RequestBody Post post) {
        Post p = this.postService.addPost(post);

        return new ResponseEntity<>(p, HttpStatus.CREATED);
    }

    @PostMapping(path="/comments/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Comment> addComment(@RequestBody Comment comment) {
        Comment c = this.commentService.addComment(comment);

        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }
}
