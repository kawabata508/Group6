<%-- 杉本 --%>
<%-- 科目変更JSP --%>
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
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">科目情報変更</h2>
			<div class="m-3">
				<form action="SubjectUpdateExecute.action" method="get">
					
					<label class="form-label" for="cd">科目コード</label><br>
					<input type="text" class="form-control mb-3" id="cd" name="cd" value="${cd}" style="border: none;" readonly>
					
					<label class="form-label" for="name">科目名</label>
					<input type="text" class="form-control mb-3" id="name" name="name" value="${name}" maxlength="20" required>
					<c:if test="${error != null }">
						<div class="mt-2 text-warning" style="color: #FF8C00;">${error}</div>
					</c:if>
					
					<p></p>
					<input type="submit" value="変更" style="padding: 0.4em 0.8em; width: auto; height: auto; border: 0px; border-radius: 5px; color: white; background-color: #1e90ff">
					<p></p>
				</form>
				<a href="SubjectList.action">戻る</a>
			</div>
		</section>
	</c:param>
</c:import>