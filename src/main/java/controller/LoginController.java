package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelException;
import model.User;
import model.dao.DAOFactory;
import model.dao.UserDAO;

@WebServlet(urlPatterns = { "/login", "/logout" })
public class LoginController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getRequestURI();

		switch (action) {
			case "/crud-manager/logout": {
				logout(req);
				ControllerUtil.redirect(resp, req.getContextPath() + "/login");
				break;
			}
			default:
				ControllerUtil.transferSessionMessagesToRequest(req);

				ControllerUtil.forward(req, resp, "/login.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getRequestURI();

		switch (action) {
			case "/crud-manager/login": {
				if (login(req)) {
					ControllerUtil.redirect(resp, req.getContextPath() + "/");
					return;
				}
				break;
			}
			default:
				System.out.println("URL inválida " + action);
				break;
		}

		ControllerUtil.redirect(resp, req.getContextPath() + "/login");
	}

	private boolean login(HttpServletRequest req) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDAO dao = DAOFactory.createDAO(UserDAO.class);

		try {
			User user = dao.authenticate(email, password);

			if (user == null) {
				ControllerUtil.errorMessage(req, "E-mail ou senha inválidos.");
				return false;
			}

			req.getSession().setAttribute("loggedUser", user);
			return true;
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}

		return false;
	}

	private void logout(HttpServletRequest req) {
		req.getSession().invalidate();
	}
}