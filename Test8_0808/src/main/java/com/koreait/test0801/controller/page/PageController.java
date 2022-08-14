package com.koreait.test0801.controller.page;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/exambook")
@RequiredArgsConstructor
public class PageController {

    @RequestMapping("/list")
    public ModelAndView exambookList() {
        return new ModelAndView("/exambook/exambook_list/exambook_list");
    }

    @RequestMapping("/view/{bkUid}")
    public ModelAndView exambookView(@PathVariable(name="bkUid") Long bkUid){
        return new ModelAndView("/exambook/exambook_list/exambook_view");
    }

    @RequestMapping("/edit/{bkUid}")
    public ModelAndView exambookEdit(@PathVariable(name="bkUid") Long bkUid){
        return new ModelAndView("/exambook/exambook_list/exambook_edit");
    }

    @RequestMapping("/regist")
    public ModelAndView exambookRegist() {
        return new ModelAndView("/exambook/exambook_regist/exambook_regist");
    }



}
