package org.pgm.todopro.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.pgm.todopro.dto.TodoDTO;
import org.pgm.todopro.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/todo")
public class TodoController {

//    @Autowired
    private final TodoService todoService;
    @GetMapping("/list")
    public void list(Model model) {
        System.out.println("list"); // todo/list
        List<TodoDTO> todoList = todoService.getAll();
        model.addAttribute("todoList", todoList);
    }
}
