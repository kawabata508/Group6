<%-- murakami --%>
<%-- サイドバー --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<div style="padding:15px">
	<c:if test="${user.isAuthenticated()}">
		<nav>
			<p><a href="Menu.action">メニュー</a></p>
			<p><a href="StudentList.action">学生管理</a></p>
			成績管理
			<ul style="padding-left:16px; list-style: none;">
				<li><a href="TestRegist.action">成績登録</a></li>
				<li><a href="TestList.action">成績参照</a></li>
			</ul>
			<p><a href="SubjectList.action">科目管理</a></p>
		</nav>
	</c:if>
</div>