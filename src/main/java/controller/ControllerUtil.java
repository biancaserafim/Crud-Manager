package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ControllerUtil {

	private static String MESSAGE_KEY = "message";
	private static int ERROR = 0;
	private static int SUCESS = 1;

	static void forward(HttpServletRequest req, HttpServletResponse resp, String target)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher(target);

		dispatcher.forward(req, resp);
	}

	static void redirect(HttpServletResponse resp, String target) throws IOException {
		resp.sendRedirect(target);
	}

	static void sucessMessage(HttpServletRequest req, String message) {
		req.getSession().setAttribute(MESSAGE_KEY, message);
		req.getSession().setAttribute("alertType", SUCESS);
	}

	static void errorMessage(HttpServletRequest req, String message) {
		req.getSession().setAttribute(MESSAGE_KEY, message);
		req.getSession().setAttribute("alertType", ERROR);
	}

	static void transferSessionMessagesToRequest(HttpServletRequest req) {
		if (req.getSession().getAttribute(MESSAGE_KEY) != null) {
			String message = (String) req.getSession().getAttribute(MESSAGE_KEY);
			req.setAttribute(MESSAGE_KEY, message);
			req.getSession().removeAttribute(MESSAGE_KEY);
		}

		if (req.getSession().getAttribute("alertType") != null) {
			Integer message = (Integer) req.getSession().getAttribute("alertType");
			req.setAttribute("alertType", message);
			req.getSession().removeAttribute("alertType");
		}
	}

	public static Date formatDate(String stringDate) {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			return dateFormat.parse(stringDate);
		} catch (ParseException e) {
			return null;
		}
	}

	private static final int PAGE_SIZE = 5;

	public static <T> List<T> paginate(HttpServletRequest req, List<T> list) {
		int page = 1;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (NumberFormatException e) {
			page = 1; // sem parâmetro ou inválido: vai pra página 1
		}

		int totalPages = (int) Math.ceil((double) list.size() / PAGE_SIZE);
		if (totalPages == 0)
			totalPages = 1;

		if (page < 1)
			page = 1;
		if (page > totalPages)
			page = totalPages;

		int start = (page - 1) * PAGE_SIZE;
		int end = Math.min(start + PAGE_SIZE, list.size());

		req.setAttribute("currentPage", page);
		req.setAttribute("totalPages", totalPages);

		return list.subList(start, end);
	}
}
