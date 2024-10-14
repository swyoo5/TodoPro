package org.pgm.todopro.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.pgm.todopro.dto.TodoDTO;
import org.pgm.todopro.service.TodoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

//컨트롤러로 인식하게 하는 어노테이션
@Controller
@Log4j2
@RequiredArgsConstructor
// localhost:/todo/list
@RequestMapping("/todo") // get, post방식 모두 받아줌
public class TodoController {

//    @Autowired
//    RequiredArgsConstructor 사용하려면 final, @Autowired 사용하면 없어도됨
    private final TodoService todoService;

    @GetMapping("/register")
    public void registerGet() {

    }

    @PostMapping("/register")
    public String registerPost(@Valid TodoDTO todoDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {
        System.out.println("registerPost()" + todoDTO);
        if (bindingResult.hasErrors()) {
            System.out.println("hasErrors...");
            redirectAttributes.addFlashAttribute("errors", bindingResult);
            return "redirect:/todo/register";
        }
        todoService.register(todoDTO);
        return "redirect:/todo/list";
    }
    @GetMapping("/list") // get방식으로 받음
    public void list(Model model) {
        System.out.println("list"); // todo/list
        List<TodoDTO> todoList = todoService.getAll();
        model.addAttribute("todoList", todoList);
    }

    @PostMapping("/remove")
    public String remove(TodoDTO todoDTO, RedirectAttributes redirectAttributes) {
        log.info("remove()");
        todoService.remove(todoDTO.getTno());
        return "redirect:/todo/list";
    }

    @PostMapping("/modify")
    public String modify(TodoDTO todoDTO, RedirectAttributes redirectAttributes) {
        log.info("modify()" + todoDTO);
        todoService.modify(todoDTO);
        redirectAttributes.addAttribute("tno", todoDTO.getTno());
        return "redirect:/todo/read";

    }

    @GetMapping({"/read", "/modify"})
    public void read(@RequestParam("tno") int tno, Model model) {
        log.info("read");
        TodoDTO todoDTO=todoService.getOne(tno);
        model.addAttribute("dto", todoDTO);
    }
}
