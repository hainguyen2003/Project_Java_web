<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<p style="color: red;">${errors}</p>
		<form action="login" method="post">
			<label for="username">Tài khoản</label> 
			<input type="text"
				name="username" id="username" value="${loginForm.username }">
				
				
			<br> <br> <label for="password">Mật khẩu</label>
			 <input
				type="password" name="password" id="password"
				value="${loginForm.password }"><br> <br> <input
				type="submit" value="Đăng nhập"> <br>
				
				<label for="rememberMe">ghi nhớ</label> <input type="checkbox" name="rememberMe" value="Y" ${loginForm.rememberMe } /> <br>
				
				<a
				href="${pageContext.request.contextPath}/">Bỏ qua</a>
		</form>
	</div>
</body>
</html>