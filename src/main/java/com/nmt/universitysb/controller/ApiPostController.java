package com.nmt.universitysb.controller;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.nmt.universitysb.dto.CommentDto;
import com.nmt.universitysb.dto.PostDto;
import com.nmt.universitysb.dto.PostUpdateDto;
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

    @GetMapping(path = "/post-user/{userId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<List<PostDto>> getPostByUserId(@PathVariable(value = "userId") int userId) {
        List<PostDto> post = postService.findByUserId(userId);
        if (post.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(post, HttpStatus.OK);
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

    @PutMapping(path = "/post-update/{postId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<String> updatePostContent(
            @PathVariable(value = "postId") int postId,
            @RequestBody PostUpdateDto post) {
        try {
            postService.updatePostContent(postId, post.getContent());
            return new ResponseEntity<>("Bài đăng đã được cập nhật.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi cập nhật bài đăng.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping(path="/comments/", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<Comment> addComment(@RequestBody Comment comment) {
        Comment c = this.commentService.addComment(comment);

        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }

    @PutMapping(path = "/comment-update/{commentId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<String> updateCommentContent(
            @PathVariable(value = "commentId") int commentId,
            @RequestBody CommentDto commentDto) {
        try {
            commentService.updateCommentContent(commentId, commentDto.getContent());
            return new ResponseEntity<>("Bình luận đã được cập nhật.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi cập nhật bình luận.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping(path ="/comments/{commentId}", produces = MediaType.APPLICATION_JSON_VALUE)
    @CrossOrigin
    public ResponseEntity<String> deleteComment(@PathVariable(value = "commentId") int commentId) {
        try {
            this.commentService.deleteComment(commentId);
            return new ResponseEntity<>("Xóa Comment thành công.", HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>("Lỗi khi xóa Comment.", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
