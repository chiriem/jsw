package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MainController {

    @GetMapping(value = "index")
    public String Index() {
        return "/index";

    }

    @GetMapping(value = "MultiStudio/MultiStudio")
    public String MultiStudio() {
        return "/MultiStudio/MultiStudio";

    }
}
