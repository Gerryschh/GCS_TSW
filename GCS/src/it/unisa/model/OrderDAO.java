package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrderDAO {
	
	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/gcs");

		} catch (Exception e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "ordine";

	public static synchronized OrderBean doSave(OrderBean order) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO " + OrderDAO.TABLE_NAME
				+ " (data_Effettuazione, prezzo_Totale, utente) VALUES (?, ?, ?)";
		
		
		try {
			connection = ds.getConnection();
			
			preparedStatement = connection.prepareStatement(insertSQL);
			
			LocalDateTime now=LocalDateTime.now();
			String n= now.getYear()+"-"+now.getMonthValue()+"-"+now.getDayOfMonth()+" "+now.getHour()+":"+now.getMinute()+":"+now.getSecond();
			preparedStatement.setString(1, n);
			preparedStatement.setDouble(2, order.getPrezzoTot());
			preparedStatement.setString(3, order.getUtente());
			
			if(preparedStatement.executeUpdate()==1) {
				order.setDataEff(n);
			}
			connection.setAutoCommit(false);
			connection.commit();
		}
		catch (Exception ex){
		      System.out.println("Insert failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return order;
	}

	public static synchronized OrderBean doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		OrderBean bean = new OrderBean();

		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setId(rs.getInt("id"));
				bean.setDataEff(rs.getString("data_effettuazione"));
				bean.setUtente(rs.getString("utente"));
				bean.setPrezzoTot(rs.getDouble("prezzo_totale"));
			}

		}
		catch (Exception ex){
		      System.out.println("OrderDAO.doRetriveByKey failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}

	public static synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + OrderDAO.TABLE_NAME + " WHERE id = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		}
		catch (Exception ex){
		      System.out.println("OrderDAO.doDelete failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	public static synchronized Collection<OrderBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> orders = new LinkedList<OrderBean>();

		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " order BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				bean.setDataEff(rs.getString("data_effettuazione"));
				bean.setUtente(rs.getString("utente"));
				bean.setPrezzoTot(rs.getDouble("prezzo_totale"));
				orders.add(bean);
			}

		}
		catch (Exception ex){
		      System.out.println("OrderDAO.doRetriveAll failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return orders;
	}
	
	public static synchronized Collection<OrderBean> doRetrieveAllbyDate(String inizio, String fine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> orders = new LinkedList<OrderBean>();

		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME + " where data_effettuazione between ? and ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, inizio);
			preparedStatement.setString(2, fine);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				bean.setDataEff(rs.getString("data_effettuazione"));
				bean.setUtente(rs.getString("utente"));
				bean.setPrezzoTot(rs.getDouble("prezzo_totale"));
				orders.add(bean);
			}
		}
		catch (Exception ex){
		      System.out.println("OrderDAO.doRetriveAllbyDate failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return orders;
	}
	
	public static synchronized Collection<OrderBean> doRetrieveAllByUser(String user) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<OrderBean> orders = new LinkedList<OrderBean>();

		String selectSQL = "SELECT * FROM " + OrderDAO.TABLE_NAME + " where utente= ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				OrderBean bean = new OrderBean();
				bean.setId(rs.getInt("id"));
				bean.setDataEff(rs.getString("data_effettuazione"));
				bean.setUtente(rs.getString("utente"));
				bean.setPrezzoTot(rs.getDouble("prezzo_totale"));
				orders.add(bean);
			}
		}
		catch (Exception ex){
		      System.out.println("OrderDAO.doRetriveAllbyUser failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return orders;
	}
	
	public static synchronized int getIdUtente(String Utente, String data) throws SQLException {
		String selectSQL = "SELECT id FROM " + OrderDAO.TABLE_NAME + " WHERE utente= ? and data_effettuazione= ?";
		int id=-1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, Utente);
			preparedStatement.setString(2, data);
			ResultSet rs = preparedStatement.executeQuery();
			rs.next();
			id=rs.getInt(1);
		}
		catch (Exception ex){
		      System.out.println("OrderDAO.getIdUtente failed: An Exception has occurred! " + ex);
		      ex.printStackTrace();
		}
		finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return id;
	}
	
}