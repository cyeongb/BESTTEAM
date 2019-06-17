package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BlogListService;
import vo.ActionForward;
import vo.BlogBean;
import vo.BlogCommentBean;
import vo.PageInfo;

public class BlogListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardListAction");

		ArrayList<BlogBean> articleList = new ArrayList<BlogBean>();
//		ArrayList<BlogCommentBean> articleList2 = (ArrayList<BlogCommentBean>) request.getAttribute("articleList");
//		int comment_blog_num = Integer.parseInt(request.getParameter("comment_blog_num"));
		
		
		int page = 1;
		int limit = 10;

		// 페이지 번호 파라미터가 있을 경우 가져오기
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		BlogListService blogListService = new BlogListService();

		int listCount = blogListService.getListCount(); // 총 게시물 목록 수 가져오기

		articleList = blogListService.getArticleList(page, limit); // 게시물 목록 가져오기(페이지 번호에 해당하는 목록을 limit 개수만큼 가져오기)
		// 댓글 갯수 계산

		// 페이지 계산
		int maxPage = (int) ((double) listCount / limit + 0.95); // 총 페이지 수 계산(올림처리를 위해 + 0.95)
		int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1; // 현재 페이지에 표시할 시작 페이지) 번호
		int endPage = startPage + 10 - 1; // 현재 페이지에 표시할 마지막 페이지 번호

		if (endPage > maxPage) { // 마지막 페이지 번호가 최대 페이지 번호보다 클 경우
			endPage = maxPage; // 마지막 페이지 번호를 최대 페이지 번호로 대체
		}

		// 페이지 번호 관련 정보를 PageInfo 객체에 저장
		PageInfo pageInfo = new PageInfo();
		pageInfo.setPage(page);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);

		// PageInfo 객체와 ArrayList 객체를 request 객체의 setAttribute() 메서드를 사용하여 저장
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
//		request.setAttribute("articleList2", articleList2);

		// ActionForward 객체를 사용하여 board 폴더의 qna_board_list.jsp 페이지로 이동 처리 => Dispatch 방식
		// 포워딩
		// => 기존 boardList.bo 주소를 변경하지 않고 바로 jsp 페이지로 이동하기 위해서
		ActionForward forward = new ActionForward();
		forward.setPath("/blog/blog.jsp");

		return forward;
	}

}
