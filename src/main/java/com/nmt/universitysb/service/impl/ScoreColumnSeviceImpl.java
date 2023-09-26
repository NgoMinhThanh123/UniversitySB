package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.ScoreColumn;
import com.nmt.universitysb.repository.ScoreColumnRepository;
import com.nmt.universitysb.service.ScoreColumnSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class ScoreColumnSeviceImpl implements ScoreColumnSevice {
    @Autowired
    private ScoreColumnRepository scoreColumnRepo;

    @Override
    public List<ScoreColumn> findAll() {
        return this.scoreColumnRepo.findAll();
    }

    @Override
    public Page<ScoreColumn> findAll(Pageable pageable) {
        return this.scoreColumnRepo.findAll(pageable);
    }

    @Override
    public Optional<ScoreColumn> findById(int id) {
        return this.scoreColumnRepo.findById(id);
    }

    @Override
    public Page<ScoreColumn> findAllByNameContaining(String keyword, Pageable pageable) {
        return this.scoreColumnRepo.findAllByNameContaining(keyword, pageable);
    }

    @Override
    public ScoreColumn save(ScoreColumn f) {
        return this.scoreColumnRepo.save(f);
    }

    @Override
    public boolean deleteScoreColumn(int id) {
        this.scoreColumnRepo.deleteById(id);
        return true;
    }
//    @Override
//    public List<ScoreColumn> getScoreColumns(Map<String, String> params) {
//        return this.scoreColumnRepo.getScoreColumns(params);
//    }
//
//    @Override
//    public boolean addOrUpdateScoreColumn(ScoreColumn u) {
//        return this.scoreColumnRepo.addOrUpdateScoreColumn(u);
//    }
//
//    @Override
//    public ScoreColumn getScoreColumnById(int id) {
//        return this.scoreColumnRepo.getScoreColumnById(id);
//    }
//
//    @Override
//    public boolean deleteScoreColumn(int id) {
//        return this.scoreColumnRepo.deleteScoreColumn(id);
//    }
//
//    @Override
//    public int countScoreColumns() {
//        return this.scoreColumnRepo.countScoreColumns();
//    }
//
//    @Override
//    public boolean addScoreColumn(ScoreColumn u) {
//        return this.scoreColumnRepo.addScoreColumn(u);
//    }

}
