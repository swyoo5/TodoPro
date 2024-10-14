package org.pgm.todopro.dto;

import jakarta.validation.constraints.Future;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TodoDTO {
    private Long tno;
    @NotEmpty
    private String title;
    @Future
    private LocalDate dueDate;
    @NotEmpty
    private String writer;
    private boolean finished;
}
