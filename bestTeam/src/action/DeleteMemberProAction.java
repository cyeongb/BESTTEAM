package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.DeleteMemberProService;
import vo.ActionForward;

public class DeleteMemberProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isDeleteSuccess = false;
		
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		DeleteMemberProService deleteMemberProService = new DeleteMemberProService();
		isDeleteSuccess = deleteMemberProService.deleteMember(id, pass);
		
		if(!isDeleteSuccess) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원탈최 실패!')");
			out.println("location.href='login.us'");
			out.println("</script>");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("id", null);
			
			forward = new ActionForward();
			forward.setPath("index.in");
			forward.setRedirect(true);
		}
		
		
		return forward;
	}

}
