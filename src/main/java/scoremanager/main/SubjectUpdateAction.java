// 杉本
package scoremanager.main;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import tool.Action;

public class SubjectUpdateAction extends Action {
	
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String cd = req.getParameter("cd");
		req.setAttribute("cd", cd);
		
		// 名前を取得するためにSubjectDaoを実体化する
		SubjectDao sd = new SubjectDao();
		School sc = new School();
		Subject sub = sd.get(cd, sc);
		req.setAttribute("name", sub.getName());
				
		req.getRequestDispatcher("subject_update.jsp").forward(req, res);
	}
}