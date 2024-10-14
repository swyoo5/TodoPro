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
//    final => autowired 할 수 없음
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
        List<TodoDTO> dtoList = todoMapper.getList().stream() // VO => stram으로 만들어줌
                .map(vo->modelMapper.map(vo, TodoDTO.class)) // vo를 꺼내와서 todoDTO 클래스에 매핑
                .collect(Collectors.toUnmodifiableList()); // 리스트로 만들어줌
        return dtoList;
    }

    @Override
    public TodoDTO getOne(int tno) {
        log.info("service.getOne");
        TodoVO todoVO = todoMapper.selectOne(tno);
//        vo => dto 변환
        TodoDTO todoDTO = modelMapper.map(todoVO, TodoDTO.class);
        return todoDTO;
    }

    @Override
    public void remove(Long tno) {
        log.info("service remove");
        todoMapper.delete(tno);
    }

    @Override
    public void modify(TodoDTO todoDTO) {
        log.info("service modify");
        TodoVO todoVO = modelMapper.map(todoDTO, TodoVO.class);
        todoMapper.update(todoVO);
    }
}
