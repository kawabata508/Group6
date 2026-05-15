// 河端・村上
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.School;
import bean.Subject;
import bean.TestListSubject;

public class TestListSubjectDao extends Dao {
	
	// private String baseSql = "";
	
	private List<TestListSubject> postFilter(ResultSet rSet) throws Exception {
		List<TestListSubject> list = new ArrayList<>();
		
		try {
			// 学生番号をキーにして、TestListSubjectを操作する
			Map<String, TestListSubject> map = new HashMap<>();

			while (rSet.next()) {
				// student_noを取得する
			    String studentNo = rSet.getString("student_no");
			    
			    // まだこの学生がいない場合は新しく作る
			    if (!map.containsKey(studentNo)) {
			        TestListSubject testListSubject = new TestListSubject();
			        testListSubject.setEntYear(rSet.getInt("ent_year"));
			        testListSubject.setStudentNo(studentNo);
			        testListSubject.setStudentName(rSet.getString("student_name"));
			        testListSubject.setClassNum(rSet.getString("class_num"));
			        
			        // 点数格納用のMapを初期化してセット
			        testListSubject.setPoints(new HashMap<String, Integer>());
			        
			        map.put(studentNo, testListSubject);
			    }
			    
			    // 学生がいたらPointsに挿入する
			    TestListSubject currentSubject = map.get(studentNo);
			    currentSubject.getPoints().put(rSet.getString("no"),  (Integer)rSet.getObject("point"));
			}

			// listにTestListSubjectを入れる
			list.addAll(map.values());		
			
		} catch (SQLException | NullPointerException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<TestListSubject> filter(int entYear, String classNum, Subject subject, School school) throws Exception {
		List<TestListSubject> list = new ArrayList<>();
		
		Connection connection = getConnection();
		
		PreparedStatement statement = null;
		
		ResultSet rSet = null;
		
		try {
			statement = connection.prepareStatement(
					"select ent_year, t.student_no, s.name as student_name, t.class_num, t.no, t.point"
					+ " from test t join student s"
					+ " on t.student_no = s.no and t.class_num = s.class_num and t.school_cd = s.school_cd"
					+ " where s.ent_year=? and t.class_num=? and t.subject_cd=? and t.school_cd=?"
					+ " order by s.no asc");
			statement.setInt(1, entYear);
			statement.setString(2, classNum);
			statement.setString(3, subject.getCd());
			statement.setString(4, school.getCd());
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
