package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.UserDAO;
import vo.UserBean;

public class UpdateMemberProService {

	public boolean setUpdate(UserBean userBean,String id, String pass) throws Exception {
		boolean isUpdate = false;
		int isRightUser = 0;
		
		Connection con = getConnection();
		UserDAO userDAO = UserDAO.getInstance();
		userDAO.setConnection(con);
		
		isRightUser = userDAO.isUpdateUser(id, pass);
		
		if(isRightUser==1) {
			isUpdate = userDAO.userUpdate(userBean);
			commit(con);
		} else {
			rollback(con);
		}
	
		
		return isUpdate;
	}

	
}
