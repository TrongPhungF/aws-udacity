package com.love.mylove.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

    @RequestMapping(value = { "/", "/i-love-you" ,"/my-love" }, method = RequestMethod.GET)
    public String index(Model model) {
        return "MyLove";
    }
}
