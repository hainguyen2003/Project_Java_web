<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bookstore_style.css">
<title>Website Cửa Hàng Sách</title>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div align="center">
		<h3>Danh sách các cuốn sách</h3>
		<p style="color: red;">${errors }</p>
		<table border="1">
			<tr>
				<th>Tiêu đề</th>
				<th>Tác giả</th>
				<th>Giá tiền</th>
				<th>Thao tác</th>
			</tr>
			<c:forEach items="${bookList}" var="book">
				<tr>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td><fmt:formatNumber type="number" value="${book.price }" /><sup>đ</sup></td>

					<!gọi đến servlet có tên liên kết detailBook, truyền thông tin bookId
					 để xem thông tin chi tiết cuốn sách -->
					<td><a href="detailBook?bookId=${book.bookId }">Xem chi
							tiết</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>