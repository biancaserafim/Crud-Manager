
package model.dao;

import java.util.ArrayList;
import java.util.List;

import model.ModelException;
import model.Product;
import model.Supplier;

public class MySQLProductDAO implements ProductDAO {

    @Override
    public boolean save(Product product) throws ModelException {
        DBHandler db = new DBHandler();

        String sqlInsert = "INSERT INTO products VALUES (DEFAULT, ?, ?, ?, ?, ?);";

        db.prepareStatement(sqlInsert);

        db.setString(1, product.getName());
        db.setBigDecimal(2, product.getPrice());
        db.setString(3, product.getUnit());
        db.setDate(4, product.getExpirationDate());
        db.setInt(5, product.getSupplier().getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean update(Product product) throws ModelException {
        DBHandler db = new DBHandler();

        String sqlUpdate = "UPDATE products "
                + " SET name = ?, "
                + " price = ?, "
                + " unit = ?, "
                + " expiration_date = ?, "
                + " supplier_id = ? "
                + " WHERE id = ?;";

        db.prepareStatement(sqlUpdate);

        db.setString(1, product.getName());
        db.setBigDecimal(2, product.getPrice());
        db.setString(3, product.getUnit());
        db.setDate(4, product.getExpirationDate());
        db.setInt(5, product.getSupplier().getId());
        db.setInt(6, product.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public boolean delete(Product product) throws ModelException {
        DBHandler db = new DBHandler();

        String sqlDelete = "DELETE FROM products WHERE id = ?;";

        db.prepareStatement(sqlDelete);
        db.setInt(1, product.getId());

        return db.executeUpdate() > 0;
    }

    @Override
    public List<Product> listAll() throws ModelException {
        DBHandler db = new DBHandler();

        List<Product> products = new ArrayList<Product>();

        String sqlQuery = "SELECT p.id AS product_id, "
                + "p.name AS product_name, p.price, p.unit, "
                + "p.expiration_date, p.supplier_id, "
                + "s.name AS supplier_name "
                + "FROM products p "
                + "INNER JOIN suppliers s "
                + "ON p.supplier_id = s.id;";

        db.createStatement();
        db.executeQuery(sqlQuery);

        while (db.next()) {
            Supplier supplier = new Supplier(db.getInt("supplier_id"));
            supplier.setName(db.getString("supplier_name"));

            Product product = new Product(db.getInt("product_id"));
            product.setName(db.getString("product_name"));
            product.setPrice(db.getBigDecimal("price"));
            product.setUnit(db.getString("unit"));
            product.setExpirationDate((java.sql.Date) db.getDate("expiration_date"));
            product.setSupplier(supplier);

            products.add(product);
        }

        return products;
    }

    @Override
    public List<Product> search(String search) throws ModelException {
        DBHandler db = new DBHandler();

        List<Product> products = new ArrayList<Product>();

        String sqlQuery = "SELECT p.id AS product_id, "
                + "p.name AS product_name, p.price, p.unit, "
                + "p.expiration_date, p.supplier_id, "
                + "s.name AS supplier_name "
                + "FROM products p "
                + "INNER JOIN suppliers s "
                + "ON p.supplier_id = s.id "
                + "WHERE p.name LIKE ? OR p.unit LIKE ? OR s.name LIKE ?;";

        db.prepareStatement(sqlQuery);
        db.setString(1, "%" + search + "%");
        db.setString(2, "%" + search + "%");
        db.setString(3, "%" + search + "%");
        db.executeQuery();

        while (db.next()) {
            Supplier supplier = new Supplier(db.getInt("supplier_id"));
            supplier.setName(db.getString("supplier_name"));

            Product product = new Product(db.getInt("product_id"));
            product.setName(db.getString("product_name"));
            product.setPrice(db.getBigDecimal("price"));
            product.setUnit(db.getString("unit"));
            product.setExpirationDate((java.sql.Date) db.getDate("expiration_date"));
            product.setSupplier(supplier);

            products.add(product);
        }

        return products;
    }

    @Override
    public Product findById(int id) throws ModelException {
        DBHandler db = new DBHandler();

        String sql = "SELECT * FROM products WHERE id = ?;";

        db.prepareStatement(sql);
        db.setInt(1, id);
        db.executeQuery();

        Product product = null;

        while (db.next()) {
            product = new Product(id);
            product.setName(db.getString("name"));
            product.setPrice(db.getBigDecimal("price"));
            product.setUnit(db.getString("unit"));
            product.setExpirationDate((java.sql.Date) db.getDate("expiration_date"));

            SupplierDAO supplierDAO = DAOFactory.createDAO(SupplierDAO.class);
            Supplier supplier = supplierDAO.findById(db.getInt("supplier_id"));
            product.setSupplier(supplier);

            break;
        }

        return product;
    }
}