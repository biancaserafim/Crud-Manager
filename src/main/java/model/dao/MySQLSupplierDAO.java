package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.ModelException;
import model.Supplier;
import model.User;

public class MySQLSupplierDAO implements SupplierDAO {

	@Override
	public boolean save(Supplier supplier) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlInsert = "INSERT INTO suppliers VALUES (DEFAULT, ?, ?, ?, ?, ?);";
		
		db.prepareStatement(sqlInsert);
		
		db.setString(1, supplier.getName());
		db.setString(2, supplier.getEmail());
		db.setString(3, supplier.getPhone());
		db.setString(4, supplier.getPaymentTerm());
		db.setInt(5, supplier.getUser().getId());
		
		return db.executeUpdate() > 0;
	}

	@Override
	public boolean update(Supplier supplier) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlUpdate = "UPDATE suppliers "
				+ " SET name = ?, "
				+ " email = ?, "
				+ " phone = ?, "
				+ " payment_term = ?, "
				+ " user_id = ? "
				+ " WHERE id = ?;";
		
		db.prepareStatement(sqlUpdate);
		
		db.setString(1, supplier.getName());
		db.setString(2, supplier.getEmail());
		db.setString(3, supplier.getPhone());
		db.setString(4, supplier.getPaymentTerm());
		db.setInt(5, supplier.getUser().getId());
		db.setInt(6, supplier.getId());
		
		return db.executeUpdate() > 0;
	}

	@Override
	public boolean delete(Supplier supplier) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlDelete = "DELETE FROM suppliers WHERE id = ?;";
		
		db.prepareStatement(sqlDelete);
		db.setInt(1, supplier.getId());
		
		return db.executeUpdate() > 0;
	}

	@Override
	public List<Supplier> listAll() throws ModelException {
		DBHandler db = new DBHandler();
		
		List<Supplier> suppliers = new ArrayList<Supplier>();
		
		String sqlQuery = "SELECT s.id AS supplier_id, s.name, s.email, s.phone, "
				+ " s.payment_term, s.user_id, "
				+ " u.nome AS user_name, u.sexo, u.email AS user_email "
				+ " FROM suppliers s "
				+ " INNER JOIN users u "
				+ " ON s.user_id = u.id;";
		
		db.createStatement();
		db.executeQuery(sqlQuery);
		
		while (db.next()) {
			User user = new User(db.getInt("user_id"));
			user.setName(db.getString("user_name"));
			user.setGender(db.getString("sexo"));
			user.setEmail(db.getString("user_email"));
			
			Supplier supplier = new Supplier(db.getInt("supplier_id"));
			supplier.setName(db.getString("name"));
			supplier.setEmail(db.getString("email"));
			supplier.setPhone(db.getString("phone"));
			supplier.setPaymentTerm(db.getString("payment_term"));
			supplier.setUser(user);
			
			suppliers.add(supplier);
		}
		
		return suppliers;
	}

	@Override
	public Supplier findById(int id) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sql = "SELECT * FROM suppliers WHERE id = ?;";
		
		db.prepareStatement(sql);
		db.setInt(1, id);
		db.executeQuery();
		
		Supplier supplier = null;
		while (db.next()) {
			supplier = new Supplier(id);
			supplier.setName(db.getString("name"));
			supplier.setEmail(db.getString("email"));
			supplier.setPhone(db.getString("phone"));
			supplier.setPaymentTerm(db.getString("payment_term"));
			
			UserDAO userDAO = DAOFactory.createDAO(UserDAO.class);
			User user = userDAO.findById(db.getInt("user_id"));
			supplier.setUser(user);
			
			break;
		}
		
		return supplier;
	}
}