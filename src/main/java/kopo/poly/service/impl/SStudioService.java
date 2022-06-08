package kopo.poly.service.impl;

import kopo.poly.dto.SStudioDTO;
import kopo.poly.persistance.mongodb.impl.SStudioMapper;
import kopo.poly.persistance.mongodb.impl.SequenceMapper;
import kopo.poly.service.ISStudioService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Slf4j
@Service("SStudioService")
public class SStudioService implements ISStudioService {

    // MongoDB에 저장할 Mapper
    @Resource(name = "SStudioMapper")
    private SStudioMapper sStudioMapper;

    // MongoDB에 시퀸스 검색 Mapper
    @Resource(name = "SequenceMapper")
    private SequenceMapper sequenceMapper;

    @Override
    public int insertYoutubeaddress(SStudioDTO pDTO, String colNm) throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".insertYoutubeaddress start!");

        // 회원가입 성공 : 1, 아이디 중복으로인한 가입 취소 : 2, 기타 에러 발생 : 0
        int res = 0;


        // controller에서 값이 정상적으로 못 넘어오는 경우를 대비하기 위해 사용함
        if (pDTO == null) {
            pDTO = new SStudioDTO();
        }

        // 문제 없으면 시퀸스 증가와 함께 넣기
        // 시퀸스 값 넣기
        pDTO.setSequence(sequenceMapper.getSequence(colNm).getCol_seq());


        sequenceMapper.updateSequence(colNm);



        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".insertYoutubeaddress End!");

        return res;
    }


}