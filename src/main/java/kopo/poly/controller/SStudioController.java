package kopo.poly.controller;

import kopo.poly.service.ISStudioService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;

/**
 * UserInfo는 사용자의 정보를 관리하며, 사용자 정보를 담당하는 페이지입니다.
 */
@Slf4j
@Controller
public class SStudioController {

    /**
     * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
     */
    @Resource(name = "SStudioService")
    private ISStudioService sStudioService;

    // MongoDB 컬렉션 이름
    private String colNm = "SStudioCollection";

    /**
     * GetMapping은 GET방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * PostMapping은 POST방식을 통해 접속되는 URL 호출에 대해 실행되는 함수로 설정함을 의미함
     * GetMapping(value = "index") =>  GET방식을 통해 접속되는 URL이 index인 경우 아래 함수를 실행함
     */


    @GetMapping(value = "SingleStudio/SingleStudio")
    public String SingleStudioview() {

        log.info(this.getClass().getName() + ".SingleStudioview ok!");

        return "SingleStudio/SingleStudio";
    }

    @GetMapping(value = "SingleStudio/SStudioadd")
    public String SingleStudioadd() {

        log.info(this.getClass().getName() + ".SingleStudioview ok!");

        return "SingleStudio/SStudioadd";
    }

    /**
     * 회원가입 로직 처리
     */

}