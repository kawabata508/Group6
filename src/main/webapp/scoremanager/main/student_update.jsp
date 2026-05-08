<%-- 杉本 --%>
<%-- 学生一覧JSP --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:import url="/common/base.jsp">
	<c:param name="title">
		得点管理システム
	</c:param>
	
	<c:param name="scripts"></c:param>
	
	<c:param name="content">
		<section class="me-4">
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">学生情報変更</h2>
			<form action="StudentUpdateExecute.action" method="get">
				<div class="m-3">
					<c:if test="${judg == 0}">
						<div>${error }</div>
					</c:if>
					<label class="form-label" for="student-f1-select">入学年度</label><br>
					<input type="text" class="form-control mb-3" size="90" name="ent_year" value="${ent_year }" style="border: none;" readonly>
					<c:if test="${judg == 1}">
						<div>${error }</div>
					</c:if>
					
					<label class="form-label" for="student-f2-select">学生番号</label><br>
					<input type="text" class="form-control mb-3" size="90" name="no" value="${no }" style="border: none;" readonly>
					<c:if test="${judg == 2}">
						<div>${error }</div>
					</c:if>
					
					<label class="form-label" for="student-f3-select">氏名</label><br>
					<input type="text" class="form-control mb-3" id="student-f3-select" size="90" name="name" value="${name }" required>
					
					<label class="form-label" for="student-f4-select">クラス</label><br>
					<select class="form-select mb-3" id="student-f4-select" name="classnum">
						<c:forEach var="classnum" items="${class_num_set}">
							<option value="${classnum}" <c:if test="${classnum == select_class }">selected</c:if>>${classnum}</option>
						</c:forEach>
					</select>
					
					在学中
					<c:choose>
						<c:when test="${isAttend}">
							<input type="checkbox" name="is_attend" checked>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="is_attend">
						</c:otherwise>
					</c:choose>
					
					<div class="mt-2 text-warning">${errors.get("f1")}</div>
					<p></p>
					<input type="submit" value="変更" style="padding: 0.4em 0.8em; width: auto; height: auto; border: 0px; border-radius: 5px; color: white; background-color: #1e90ff">
					<p></p>
					<a href="StudentList.action">戻る</a>
				</div>	
			</form>	
		</section>
	</c:param>
</c:import>