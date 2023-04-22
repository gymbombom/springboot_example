package kr.co.example.ajax.model;


import lombok.*;

import java.util.List;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Ajax08VO {
    String korName;
    String engName;
    Integer age;
    String height;
    double weight;

    Ajax08VO subAjax08VO;
    List<Ajax08VO> subAjax08VOList;
}
