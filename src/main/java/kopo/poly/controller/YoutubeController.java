package kopo.poly.controller;

import kopo.poly.dto.YouTubeDTO;
import kopo.poly.service.IYoutubeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;


/*
 * Controller 선언해야만 Spring 프레임워크에서 Controller인지 인식 가능
 * 자바 서블릿 역할 수행
 * */
@Slf4j
@RestController
public class YoutubeController {

    @Resource(name = "YoutubeService")
    private IYoutubeService youTubeService;

    @Autowired
    public YoutubeController() {
        this.youTubeService = youTubeService;
    }

    @GetMapping("youtube")
    public YouTubeDTO Ind() throws Exception {
        return youTubeService.get();
    }

}