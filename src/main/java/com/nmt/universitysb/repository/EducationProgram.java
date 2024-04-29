package com.nmt.universitysb.repository;

import com.nmt.universitysb.dto.TuitionFeeDto;
import com.nmt.universitysb.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EducationProgram {
    Optional<Post> findById(int id);

    Page<EducationProgram> findAllByTitleContaining(String keyword, Pageable pageable);
    Post save(Post f);
    void deleteById(int id);
}
