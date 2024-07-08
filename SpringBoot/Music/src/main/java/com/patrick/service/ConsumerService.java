package com.patrick.service;

import com.patrick.domain.Consumer;

import java.util.List;

public interface ConsumerService {
    public Boolean insert(Consumer consumer);

    public Boolean update(Consumer consumer);

    public List<Consumer> allConsumer();

    public Consumer getConsumerById(Integer id);

    public boolean verifyPassword(String username, String password);

    public Consumer getConsumerByUsername(String username);

    public Boolean delete(Integer id);

    public boolean countUserByUserName(String username);

    public List<Integer> getPlayListByUserId(Integer userId);

    public boolean isExist(Integer id);


}
