<%-- murakami --%>
<%-- 科目削除画面 --%>
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
			<h2 class="h3 mb-3 fw-norma bg-secondary bg-opacity-10 py-2 px-4">科目情報削除</h2>
			<div class="m-3">
				<form action="SubjectDeleteExecute.action" method="get">
					<input type="hidden" name="cd" value="${subject_cd }">
					<input type="hidden" name="name" value="${subject_name }">
					「${subject_name }(${subject_cd })」を削除してもよろしいですか
					<p></p>
					<input type="submit" value="削除" style="padding: 0.4em 0.8em; width: auto; height: auto; border: 0px; border-radius: 5px; color: white; background-color: #dc3545">
					<p></p>
				</form>
				<a href="SubjectList.action">戻る</a>
			</div>
		</section>
	</c:param>
</c:import>