package kr.co.example.test.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface TestMapper {
    public Map<String, Object> selectTest02();
}
