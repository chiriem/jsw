package kopo.poly.persistance.mongodb.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Indexes;
import kopo.poly.dto.SStudioDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mongodb.AbstractMongoDBComon;
import kopo.poly.persistance.mongodb.ISStudioMapper;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.bson.Document;
import org.springframework.stereotype.Component;

import java.util.Map;

@Slf4j
@Component("SStudioMapper")
public class SStudioMapper extends AbstractMongoDBComon implements ISStudioMapper {

    // 유튜브 주소 입력하기
    @Override
    public int insertYoutubeAddress(SStudioDTO pDTO, String colNm) throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".insertYoutubeAddress Start!");

        int res = 0;

        // 컬렉션이 없다면 생성하기
        if(!mongodb.collectionExists(colNm)) {

            // 컬렉션 생성
            super.createCollection(colNm);
            // 인덱스 생성
            mongodb.getCollection(colNm).createIndex(Indexes.ascending("user_seq"));

        }

        // MongoDB 컬렉션 지정하기
        MongoCollection<Document> col = mongodb.getCollection(colNm);

        log.info(pDTO.getUser_id());

        // DTO를 Map 데이터타입으로 변경한 뒤, 변경된 Map 데이터 타입을 Document로 변경하기
        col.insertOne(new Document(new ObjectMapper().convertValue(pDTO, Map.class)));

        res = 1;

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".insertYoutubeAddress End!");

        return res;
    }

//    @Override
//    public UserInfoDTO getYoutubeExists(SStudioDTO pDTO, String colNm) throws Exception {
//
//        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
//        log.info(this.getClass().getName() + ".getYoutubeExists Start!");
//
//        // 조회 결과를 전달하기 위한 객체 생성하기
//        UserInfoDTO rDTO = new UserInfoDTO();
//
//        // MongoDB 컬렉션 지정하기
//        MongoCollection<Document> col = mongodb.getCollection(colNm);
//
//        // 조회 결과 중 출력할 컬럼들(SQL의 SELECT절과 FROM절 가운데 컬럼들과 유사함)
//        Document projection = new Document();
//        projection.append("youtube_address", CmmUtil.nvl(pDTO.getYoutube_address()));
//
//        // 결과 값을 카운트한다.
//        long ll = col.countDocuments(projection);
//
//        // 비교 시작
//        rDTO.setExists_yn(ll > 0 ? "Y" : "N");
//
//        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
//        log.info(this.getClass().getName() + ".getYoutubeExists End!");
//
//        return rDTO;
//    }
}