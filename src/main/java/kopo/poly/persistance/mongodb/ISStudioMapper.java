package kopo.poly.persistance.mongodb;

import kopo.poly.dto.SStudioDTO;

public interface ISStudioMapper {

    /**
     * 유튜브 주소 입력하기
     *
     * @param pDTO 저장할 정보
     * @param colNm 저장할 컬랙션 이름
     * @return 저장 성공 여부
     * @throws Exception
     */
    int insertYoutubeAddress(SStudioDTO pDTO, String colNm) throws Exception;

//    UserInfoDTO getYoutubeExists(SStudioDTO pDTO, String colNm) throws Exception;

}