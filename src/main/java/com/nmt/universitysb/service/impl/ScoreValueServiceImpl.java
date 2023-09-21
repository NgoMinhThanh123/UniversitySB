package com.nmt.universitysb.service.impl;
import com.nmt.universitysb.model.ScoreValue;
import com.nmt.universitysb.repository.ScoreValueRepository;
import com.nmt.universitysb.service.ScoreValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;


@Service
public class ScoreValueServiceImpl implements ScoreValueService {
    @Autowired
    private ScoreValueRepository scoreValueRepo;

    @Override
    public List<ScoreValue> findAll() {
        return this.scoreValueRepo.findAll();
    }

    @Override
    public Optional<ScoreValue> findById(int id) {
        return this.scoreValueRepo.findById(id);
    }

    @Override
    public long count() {
        return this.scoreValueRepo.count();
    }

    @Override
    public ScoreValue save(ScoreValue f) {
        return this.scoreValueRepo.save(f);
    }

    @Override
    public boolean deleteScoreValue(int id) {
        this.scoreValueRepo.deleteById(id);
        return true;
    }

//    @Override
//    public List<ScoreValue> getScoreValues(Map<String, String> params) {
//        return this.scoreValueRepo.getScoreValues(params);
//    }
//
//    @Override
//    public boolean addOrUpdateScoreValue(ScoreValue u) {
//        return this.scoreValueRepo.addOrUpdateScoreValue(u);
//    }
//
//    @Override
//    public ScoreValue getScoreValueById(int id) {
//        return this.scoreValueRepo.getScoreValueById(id);
//    }
//
//    @Override
//    public boolean deleteScoreValue(int id) {
//        return this.scoreValueRepo.deleteScoreValue(id);
//    }
//
//    @Override
//    public int countScoreValues() {
//        return this.scoreValueRepo.countScoreValues();
//    }
//
//    @Override
//    public ScoreValue addScoreValue(ScoreValue u) {
//        return this.scoreValueRepo.addScoreValue(u);
//    }

}
