// 河端
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import bean.TestListStudent;

public class TestListStudentDao extends Dao {
	
	// private String baseSql = "";
	
	private List<TestListStudent> postFilter(ResultSet rSet) throws Exception {
		List<TestListStudent> list = new ArrayList<>();
		
		try {
			while(rSet.next()) {
				TestListStudent testListStudent = new TestListStudent();
				
				testListStudent.setSubjectName(rSet.getString("subject_name"));
				testListStudent.setSubjectCd(rSet.getString("subject_cd"));
				testListStudent.setNum(rSet.getInt("num"));
				int point = rSet.getInt("point");
				if (rSet.wasNull()) {
					continue;
				}
				testListStudent.setPoint(point);
				
				list.add(testListStudent);
			}
			
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<TestListStudent> filter(Student student) throws Exception {
		List<TestListStudent> list = new ArrayList<>();
		
		Connection connection = getConnection();
		
		PreparedStatement statement = null;
		
		ResultSet rSet = null;
		
		try {
			statement = connection.prepareStatement(
					"select s.name as subject_name, t.subject_cd, t.no as num, t.point"
					+ " from test t join subject s"
					+ " on t.subject_cd = s.cd and t.school_cd = s.school_cd"
					+ " where t.student_no=?"
					+ " order by t.subject_cd asc");
			statement.setString(1, student.getNo());
			rSet = statement.executeQuery();
			
			list = postFilter(rSet);
			
		} catch (Exception e) {
			throw e;
		} finally {
			if (statement != null) {
				try {
					statement.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException sqle) {
					throw sqle;
				}
			}
		}
		
		return list;
	}
}
