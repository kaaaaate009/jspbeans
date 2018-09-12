package com;

import java.sql.*;

public class bean {

	String connectionURL = "jdbc:mysql://localhost:3306/test";
	Connection conn = null;

	public bean() {
		super();
	}

	public boolean connect() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(connectionURL, "root", "admin");
		return true;
	}

	public void close() throws SQLException {
		conn.close();
	}

	public ResultSet execSQL(String sql) throws SQLException {
		Statement s = conn.createStatement();
		ResultSet r = s.executeQuery(sql);
		return r;
	}

	public int updateSQL(String sql) throws SQLException {
		Statement s = conn.createStatement();
		int r = s.executeUpdate(sql);
		return r;

	}

}