package com.patrick.service.impl;

import com.patrick.dao.ConsumerMapper;
import com.patrick.domain.Consumer;
import com.patrick.service.ConsumerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ConsumerServiceImpl implements ConsumerService {
    @Autowired
    private ConsumerMapper consumerMapper;

    @Override
    public Boolean insert(Consumer consumer) {
        return consumerMapper.insert(consumer) > 0;
    }

    @Override
    public Boolean update(Consumer consumer) {
        return consumerMapper.update(consumer) > 0;
    }

    @Override
    public List<Consumer> allConsumer() {
        return consumerMapper.allConsumer();
    }

    @Override
    public Consumer getConsumerById(Integer id) {
        return consumerMapper.getConsumerById(id);
    }

    @Override
    public boolean verifyPassword(String username, String password) {
        return consumerMapper.verifyPassword(username, password) > 0;
    }

    @Override
    public Boolean delete(Integer id) {
        return consumerMapper.delete(id) > 0;
    }

    @Override
    public boolean countUserByUserName(String username) {
        return consumerMapper.countUserByUserName(username) > 0;
    }

    @Override
    public List<Integer> getPlayListByUserId(Integer userId) {
        return consumerMapper.getPlayListByUserId(userId);
    }

    @Override
    public boolean isExist(Integer id) {
        return consumerMapper.isExist(id) > 0;
    }

    @Override
    public Consumer getConsumerByUsername(String username) {
        return consumerMapper.getConsumerByUsername(username);
    }
}
