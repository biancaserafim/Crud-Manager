package controller;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Intercepta todas as requisições: se não houver usuário logado na sessão,
// redireciona para a tela de login (exceto /login e os arquivos estáticos).
@WebFilter(urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;

		String path = req.getRequestURI().substring(req.getContextPath().length());

		boolean publicResource = path.equals("/login")
				|| path.startsWith("/css/") || path.startsWith("/js/")
				|| path.startsWith("/images/") || path.startsWith("/fonts/");

		HttpSession session = req.getSession(false);
		boolean logged = session != null && session.getAttribute("loggedUser") != null;

		if (logged || publicResource) {
			chain.doFilter(request, response);
		} else {
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
}
