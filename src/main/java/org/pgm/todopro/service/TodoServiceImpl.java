package org.pgm.todopro.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.pgm.todopro.dto.TodoDTO;
import org.pgm.todopro.mapper.TodoMapper;
import org.pgm.todopro.vo.TodoVO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Log4j2
@RequiredArgsConstructor
public class TodoServiceImpl implements TodoService{
    private final TodoMapper todoMapper;
    private final ModelMapper modelMapper;
    @Override
    public void register(TodoDTO todoDTO) {
        System.out.println("service register" + todoDTO);
        TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
        System.out.println(todoVO);
        todoMapper.insert(todoVO);
    }

    @Override
    public List<TodoDTO> getAll() {
        System.out.println("service.getAll");
//        vo로 고치는게 없다면
//        return todoMapper.getList();
        List<TodoDTO> dtoList = todoMapper.getList().stream()
                .map(vo->modelMapper.map(vo, TodoDTO.class))
                .collect(Collectors.toUnmodifiableList());
        return dtoList;
    }
}
