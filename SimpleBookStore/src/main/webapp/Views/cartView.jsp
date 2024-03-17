<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Giỏ hàng</title>
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_menu.jsp"></jsp:include>
	<div align="center">
		<h3>Các cuốn sách trong giỏ hàng</h3>
		<form id="removedBookFromCartForm" action="removeFromCart"
			method="post">
			<input type="hidden" name="bookId" id="removedBookFromCart">
		</form>

		<table border="1">
			<tr>
				<th>Tiêu đề</th>
				<th>Tác giả</th>
				<th>Giá tiền</th>
				<th>Số lượng mua</th>
				<th>Tổng thành phần</th>
				<th>Thao tác</th>
			</tr>
			<c:forEach items="${cartOfCustomer.cartItemList}" var="entry">
				<tr>
					<td>${entry.value.selectedBook.title }</td>
					<!-- .value: truy cập trực tiếp vào value của hashMap mà không quan tâm đến key -->
					<td>${entry.value.selectedBook.author }</td>
					<td>
					<fmt:setLocale value="en_US" />
					<fmt:formatNumber type="number" maxFractionDigits="0" 
							value="${entry.value.selectedBook.price }" /> <sup>đ</sup></td>
					<td><img alt="remove-icon"
						src="${pageContext.request.contextPath }/img/icons-minus.png"
						onclick="minusValueAndUpdateCart('quantity${entry.value.selectedBook.bookId}');"
						width="20" height="20"> <input type="text"
						value="${entry.value.quantity }" size="2"
						style="line-height: 20px"
						id="quantity${entry.value.selectedBook.bookId}"
						onchange="validateValueAndUpdateCart(this,${entry.value.selectedBook.quantityInStock},${entry.value.selectedBook.bookId },${entry.value.selectedBook.price})">
						<img alt="plus-img"
						src="${pageContext.request.contextPath }/img/icons-add.png"
						onclick="plusValueAndUpdateCart('quantity${entry.value.selectedBook.bookId}',${entry.value.selectedBook.quantityInStock})"
						width="20" height="20"></td>
					<td><span id="subtotal${entry.value.selectedBook.bookId }"><fmt:formatNumber
								type="number" maxFractionDigits="0"
								value="${entry.value.selectedBook.price * entry.value.quantity }"/></span>
						<sup>đ</sup></td>
					<td><button type="button"
							onclick="onClickRemoveBook('${entry.value.selectedBook.title}',${entry.value.selectedBook.bookId })">
							Loại khỏi giỏ hàng</button></td>
				</tr>
			</c:forEach>
		</table>
		<br> <a href="${pageContext.request.contextPath }/clientHome">Tiếp
			tục chọn sách</a>&nbsp;&nbsp; Tổng số tiền: <b><span id="total">
				<fmt:formatNumber type="number" maxFractionDigits="0"
					value="${cartOfCustomer.totalCost }" /> <sup>đ</sup>
		</span></b>
	</div>
</body>
</html>