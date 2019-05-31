package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class DerbyUtil {

	private final static String URL = "jdbc:derby://localhost:1527/OnlineMovieStore";
	private static final String USER = "oms";
	private static final String PASSWORD = "13282367";

	static List<Map<String, Object>> ret = null;
	static PreparedStatement ps = null;
	static ResultSet rs = null;

	private static Connection conn = null;
	static {
		try {
			Class.forName("org.apache.derby.jdbc.ClientDriver");
			conn = (Connection) DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() {
		return conn;
	}


	public static List<Map<String, Object>> select(String sql, Object[] obj) {
		try {
			ps = conn.prepareStatement(sql);
			if (obj != null && obj.length > 0) {
				for (int i = 0, len = obj.length; i < len; i++) {
					ps.setObject(i + 1, obj[i]);
				}
			}
			if(ps.isClosed()) return null;
			rs = ps.executeQuery();
			ResultSetMetaData rmd = rs.getMetaData();
			ret = new ArrayList<Map<String, Object>>();
			while (rs.next()) {
				Map<String, Object> rowMap = new LinkedHashMap<String, Object>();
				for (int i = 1, count = rmd.getColumnCount() + 1; i < count; i++) {
					rowMap.put(rmd.getColumnName(i), rs.getObject(i));
				}
				ret.add(rowMap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}

	public static void update(String sql, Object[] obj) {
		try {
			ps = conn.prepareStatement(sql);
			if (obj != null && obj.length > 0) {
				for (int i = 0, len = obj.length; i < len; i++) {
					ps.setObject(i + 1, obj[i]);
				}
			}
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}

}
