<%@ page language="Java" import="java.sql.*"%>
<html>
<head>
<title>JSP with JavaBeans</title>
<%!ResultSet rs = null;
	ResultSetMetaData rsmd = null;
	int numColumns;
	int i;%>
</head>
<body bgcolor="#ffccff">
	<h1>JSP using JavaBeans example</h1>
	<jsp:useBean id="db" class="com.bean" scope="request">
		<jsp:setProperty name="db" property="*" />
		<form name="form1" method="POST">

			<%
				db.connect();
					try {
						rs = db.execSQL("select * from employee");
						while (rs.next()) {
			%>

			<table border="2" bordercolor="#2494b7">
				<tr>
					<th>ID</th>
					<th>FIRST NAME</th>
					<th>LAST NAME</th>
				</tr>

				<tr>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("FIRST_NAME")%></td>
					<td><%=rs.getString("LAST_NAME")%></td>
				</tr>
			</table>
			<%
				}
						db.close();
					} catch (SQLException e) {
						throw new ServletException("Your query is not working", e);
					}
			%>

		</form>
	</jsp:useBean>
</body>
</html>