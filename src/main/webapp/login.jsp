<jsp:directive.page contentType="text/html; charset=UTF-8" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">

<head>
	<%@include file="base-head.jsp" %>
	<title>CRUD Manager - Login</title>
</head>

<body>
	<div class="container" style="max-width: 400px; margin-top: 80px;">
		<h3 class="page-header text-center">
			<img height="30px" width="30px" alt="PM" src="${pageContext.request.contextPath}/images/logo.png">
			CRUD Manager
		</h3>

				<div id="alert" style="position: static; width: auto; ${not empty message ? 'display: block;' : 'display: none;'}"
			class="alert alert-dismissable ${alertType eq 1 ? 'alert-success' : 'alert-danger'}">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			${message}
		</div>

		<form action="${pageContext.request.contextPath}/login" method="POST">
			<div class="form-group">
				<label for="email">E-mail</label>
				<input type="email" class="form-control" id="email" name="email" autofocus
					placeholder="Seu e-mail" required>
			</div>

			<div class="form-group">
				<label for="password">Senha</label>
				<input type="password" class="form-control" id="password" name="password"
					placeholder="Sua senha" required>
			</div>

			<button type="submit" class="btn btn-primary btn-block">Entrar</button>
		</form>
	</div>
		<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			// fecha o alert após 3 segundos
			setTimeout(function () {
				$("#alert").slideUp(500);
			}, 3000);
		});
	</script>
</body>

</html>