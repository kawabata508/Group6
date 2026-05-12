<%-- 河端 --%>
<%-- 科目登録JSP --%>
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
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">科目情報登録</h2>
			<form action="SubjectCreateExecute.action" method="post">
				<div class="m-3">
					<label class="form-label" for="student-f1-select">科目コード</label>
					<input type="text" class="form-control mb-3" id="student-f1-select" name="cd" value="${cd}" maxlength="3" placeholder="科目コードを入力してください" required />
					<div class="mt-2 text-warning">${error}</div>
					
					<label class="form-label" for="student-f2-select">科目名</label>
					<input type="text" class="form-control mb-3" id="student-f2-select" name="name" value="${name}" maxlength="20" placeholder="科目名を入力してください" required />
					
					<input type="submit" value="登録" style="padding: 0.4em 0.8em; width: auto; height: auto; border: 0px; border-radius: 5px; color: white; background-color: #1e90ff">
					<p></p>
					<a href="SubjectList.action">戻る</a>
				</div>
			</form>
		</section>
	</c:param>
</c:import>
