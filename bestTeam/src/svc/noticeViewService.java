package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.noticeDAO;
import vo.noticeBean;

public class noticeViewService {
	
	// 글 번호(notice_num)을 전달받아 해당 게시물 정보를 조회하는 getArticle() 메서드 정의
	public noticeBean getArticle(int notice_num) throws Exception {
//		System.out.println("noticeViewService - getArticle()");
		noticeBean noticeBean = null;
		
		Connection con = getConnection();
		
		// noticeDAO 인스턴스 얻어오기 => setConnection() 메서드를 호출하여 Connection 객체 전달
		noticeDAO NoticeDAO = noticeDAO.getInstance();
		NoticeDAO.setConnection(con);
		
		// noticeDAO 객체의 selectArticle() 메서드를 호출하여 글번호(notice_num)를 전달 => noticeBean 객체 리턴받음
		noticeBean = NoticeDAO.selectArticle(notice_num);
		
		// 게시물을 성공적으로 읽어왔을 때 조회수 증가 처리
		int updateCount = NoticeDAO.updateReadcount(notice_num);
		   
		// updateCount 가 1일 경우 commit, 0일 경우 rollback 수행
		if(updateCount == 1) {
			commit(con);
		} else {
			rollback(con);
		}
		
		// Connection 객체 반환
		close(con);
		
		return noticeBean;
	}
}






















