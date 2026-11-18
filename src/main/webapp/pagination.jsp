<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<ul class="pagination">
		<li class="${currentPage == 1 ? 'disabled' : ''}">
			<a href="?page=${currentPage - 1}">&lt; Anterior</a>
		</li>

		<c:forEach var="i" begin="1" end="${totalPages}">
			<li class="${i == currentPage ? 'active' : ''}">
				<a href="?page=${i}">${i}</a>
			</li>
		</c:forEach>

		<li class="${currentPage == totalPages ? 'disabled' : ''}">
			<a href="?page=${currentPage + 1}">Próximo &gt;</a>
		</li>
	</ul>