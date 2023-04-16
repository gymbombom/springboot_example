package kr.co.example.test.service;

import kr.co.example.test.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class TestServiceImpl implements TestService {

    @Autowired
    TestMapper testMapper;

    public Map<String, Object> selectTest02() {
        return testMapper.selectTest02();
    }
}
