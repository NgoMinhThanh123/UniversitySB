package com.nmt.universitysb.service.impl;

import com.nmt.universitysb.model.TuitionFee;
import com.nmt.universitysb.repository.TuitionFeeRepository;
import com.nmt.universitysb.service.TuitionFeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TuitionFeeServiceImpl implements TuitionFeeService {
    @Autowired
    private TuitionFeeRepository tuitionFeeRepository;

    @Override
    public List<TuitionFee> findAll() {
        return this.tuitionFeeRepository.findAll();
    }

    @Override
    public Page<TuitionFee> findAll(Pageable pageable) {
        return this.tuitionFeeRepository.findAll(pageable);
    }

    @Override
    public Optional<TuitionFee> findById(String id) {
        return this.tuitionFeeRepository.findById(id);
    }

    @Override
    public Page<TuitionFee> findAllByStudentIdContaining(String keyword, Pageable pageable) {
        return this.tuitionFeeRepository.findAllByStudentIdContaining(keyword, pageable);
    }

    @Override
    public TuitionFee save(TuitionFee f) {
        return this.tuitionFeeRepository.save(f);
    }

    @Override
    public long count() {
        return this.tuitionFeeRepository.count();
    }

    @Override
    public boolean deleteTuitionFee(String id) {
        this.tuitionFeeRepository.deleteById(id);
        return true;
    }
}
