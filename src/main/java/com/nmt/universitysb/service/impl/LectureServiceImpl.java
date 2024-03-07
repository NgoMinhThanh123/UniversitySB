package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.dto.LecturerDto;
import com.nmt.universitysb.model.Lecturer;
import com.nmt.universitysb.repository.LecturerRepository;
import com.nmt.universitysb.service.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LectureServiceImpl implements LecturerService {

    @Autowired
    private LecturerRepository lecturersRepo;

    @Override
    public List<Lecturer> findAll() {
        return this.lecturersRepo.findAll();
    }

    @Override
    public Page<Lecturer> findAll(Pageable pageable) {
        return this.lecturersRepo.findAll(pageable);
    }

    @Override
    public Optional<Lecturer> findById(String id) {
        return this.lecturersRepo.findById(id);
    }

    @Override
    public Page<Lecturer> findAllByNameContaining(String keyword, Pageable pageable) {
        return this.lecturersRepo.findAllByNameContaining(keyword, pageable);
    }

    @Override
    public Lecturer save(Lecturer f) {
        return this.lecturersRepo.save(f);
    }

    @Override
    public long count() {
        return this.lecturersRepo.count();
    }

    @Override
    public boolean deleteLecturer(String id) {
        this.lecturersRepo.deleteById(id);
        return true;
    }

    @Override
    public LecturerDto getLecturerByUsername(String username) {
        Lecturer u = this.lecturersRepo.getLecturerByUsername(username);
        LecturerDto lecturerDto = new LecturerDto();
        lecturerDto.setId(u.getId());
        lecturerDto.setName(u.getName());
        lecturerDto.setBirthday(u.getBirthday());
        lecturerDto.setGender(u.getGender());
        lecturerDto.setPhone(u.getPhone());
        lecturerDto.setAddress(u.getAddress());
        lecturerDto.setFacultyId(u.getFacultyId());

        return lecturerDto;
    }

}
