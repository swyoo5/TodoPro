package org.pgm.todopro.vo;


import lombok.*;

import java.time.LocalDate;

// VO : Value Object
// VO는 Setter가 따로 필요없음. 규모가 작은 프로젝트에선 DTO만 사용해도 됨. controller => service 전달 : DTO(순수하게 데이터를 읽기만 하는 목적), service => mapper전달 : VO
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodoVO {
    private Long tno;
    private String title;
    private LocalDate dueDate;
    private String writer;
    private boolean finished;
}
