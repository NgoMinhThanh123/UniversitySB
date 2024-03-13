package com.nmt.universitysb.repository;///*

import com.nmt.universitysb.dto.LecturerDto;
import com.nmt.universitysb.model.Lecturer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface LecturerRepository extends JpaRepository<Lecturer, String> {
    Optional<Lecturer> findById(String id);

    Page<Lecturer> findAllByNameContaining(String keyword, Pageable pageable);
    Lecturer save(Lecturer f);
    void deleteById(String id);
    @Query("select new com.nmt.universitysb.dto.LecturerDto(l.id, l.name, l.birthday, l.gender, l.identification, l.phone, l.address, l.facultyId, l.userId, l.classesId) " +
            "from Lecturer l " +
            "join User u on l.userId = u.id " +
            "where u.username = :username")
    LecturerDto getLecturerByUsername(@Param("username") String username);
}
