package kopo.poly.service;

import kopo.poly.dto.NoticeDTO;
import java.util.List;


public interface INoticeService {

	/**
	 * 공지사항 리스트 불러오기
	 */
	List<NoticeDTO> getNoticeList(String colNm) throws Exception;

	/**
	 * 공지사항 저장하기
	 */
	int insertNoticeInfo(NoticeDTO pDTO, String colNm) throws Exception;

	/**
	 * 공지사항 상세보기
	 */
	NoticeDTO getNoticeInfo(NoticeDTO pDTO, String colNm) throws Exception;

	/**
	 * 공지사항 조회수 새로고침하기
	 */
	int updateNoticeReadCnt(NoticeDTO pDTO, String colNm) throws Exception;

	/**
	 * 공지사항 수정하기
	 */
	int updateNoticeInfo(NoticeDTO pDTO, String colNm) throws Exception;

	/**
	 * 공지사항 삭제하기
	 */
	int deleteNoticeInfo(NoticeDTO pDTO, String colNm) throws Exception;
	
}

