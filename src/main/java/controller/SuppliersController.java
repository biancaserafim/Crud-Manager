package controller;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelException;
import model.Supplier;
import model.User;
import model.dao.DAOFactory;
import model.dao.SupplierDAO;

@WebServlet(urlPatterns = { "/suppliers", "/supplier/form",
		"/supplier/insert", "/supplier/delete", "/supplier/update" })
public class SuppliersController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String action = req.getRequestURI();

		switch (action) {
			case "/crud-manager/supplier/form": {
				CommonsController.listUsers(req);
				req.setAttribute("action", "insert");
				ControllerUtil.forward(req, resp, "/form-supplier.jsp");
				break;
			}
			case "/crud-manager/supplier/update": {
				String idStr = req.getParameter("supplierId");
				int idSupplier = Integer.parseInt(idStr);

				SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

				Supplier supplier = null;
				try {
					supplier = dao.findById(idSupplier);
				} catch (ModelException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				CommonsController.listUsers(req);
				req.setAttribute("action", "update");
				req.setAttribute("supplier", supplier);
				ControllerUtil.forward(req, resp, "/form-supplier.jsp");
				break;
			}
			default:
				listSuppliers(req);

				ControllerUtil.transferSessionMessagesToRequest(req);

				ControllerUtil.forward(req, resp, "/suppliers.jsp");
		}
	}

	private void listSuppliers(HttpServletRequest req) {
		SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

		List<Supplier> suppliers = null;
		try {
			suppliers = dao.listAll();
		} catch (ModelException e) {
			// Log no servidor
			e.printStackTrace();
		}

		if (suppliers != null) {
			suppliers = ControllerUtil.paginate(req, suppliers);
			req.setAttribute("suppliers", suppliers);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String action = req.getRequestURI();

		switch (action) {
			case "/crud-manager/supplier/insert": {
				insertSupplier(req, resp);
				break;
			}
			case "/crud-manager/supplier/delete": {

				deleteSupplier(req, resp);

				break;
			}

			case "/crud-manager/supplier/update": {
				updateSupplier(req, resp);
				break;
			}

			default:
				System.out.println("URL inválida " + action);
		}

		ControllerUtil.redirect(resp, req.getContextPath() + "/suppliers");
	}

	private void updateSupplier(HttpServletRequest req, HttpServletResponse resp) {
		String supplierIdStr = req.getParameter("supplierId");
		String supplierName = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String paymentTerm = req.getParameter("paymentTerm");
		Integer userId = Integer.parseInt(req.getParameter("user"));

		Supplier supplier = new Supplier(Integer.parseInt(supplierIdStr));
		supplier.setName(supplierName);
		supplier.setEmail(email);
		supplier.setPhone(phone);
		supplier.setPaymentTerm(paymentTerm);
		supplier.setUser(new User(userId));

		SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

		try {
			if (dao.update(supplier)) {
				ControllerUtil.sucessMessage(req, "Fornecedor '" +
						supplier.getName() + "' atualizado com sucesso.");
			} else {
				ControllerUtil.errorMessage(req, "Fornecedor '" +
						supplier.getName() + "' não pode ser atualizado.");
			}
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}
	}

	private void deleteSupplier(HttpServletRequest req, HttpServletResponse resp) {
		String supplierIdParameter = req.getParameter("id");

		int supplierId = Integer.parseInt(supplierIdParameter);

		SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

		try {
			Supplier supplier = dao.findById(supplierId);

			if (supplier == null)
				throw new ModelException("Fornecedor não encontrado para deleção.");

			if (dao.delete(supplier)) {
				ControllerUtil.sucessMessage(req, "Fornecedor '" +
						supplier.getName() + "' deletado com sucesso.");
			} else {
				ControllerUtil.errorMessage(req, "Fornecedor '" +
						supplier.getName() + "' não pode ser deletado. "
						+ "Há dados relacionados ao fornecedor.");
			}
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
			if (e.getCause() instanceof SQLIntegrityConstraintViolationException) {
				ControllerUtil.errorMessage(req, "Fornecedor não pode ser deletado. "
						+ "Há dados relacionados ao fornecedor.");
			} else {
				ControllerUtil.errorMessage(req, e.getMessage());
			}
		}
	}

	private void insertSupplier(HttpServletRequest req, HttpServletResponse resp) {
		String supplierName = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String paymentTerm = req.getParameter("paymentTerm");
		Integer userId = Integer.parseInt(req.getParameter("user"));

		Supplier sup = new Supplier();
		sup.setName(supplierName);
		sup.setEmail(email);
		sup.setPhone(phone);
		sup.setPaymentTerm(paymentTerm);
		sup.setUser(new User(userId));

		SupplierDAO dao = DAOFactory.createDAO(SupplierDAO.class);

		try {
			if (dao.save(sup)) {
				ControllerUtil.sucessMessage(req, "Fornecedor '" + sup.getName()
						+ "' salvo com sucesso.");
			} else {
				ControllerUtil.errorMessage(req, "Fornecedor '" + sup.getName()
						+ "' não pode ser salvo.");
			}
		} catch (ModelException e) {
			// log no servidor
			e.printStackTrace();
			ControllerUtil.errorMessage(req, e.getMessage());
		}
	}

}