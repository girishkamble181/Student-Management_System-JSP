<%@ page import="java.sql.*"%>

<%
	if (request.getParameter("drno") != null )
	{
		try
		{
		DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","system","abc123");
		String sql = "delete from student_11july21 where rno = ?";
		PreparedStatement pst = con.prepareStatement(sql);
		pst.setInt(1, Integer.parseInt(request.getParameter("drno")));
		pst.executeUpdate();
		}
	
		catch(SQLException e)
		{
			out.println("issue " + e);
		}
	}
%>

<html>
<head>
	<title> Student CRUD by GK </title>
	<style>
		* { font-size: 30px; }
		table {
			width: 40%;
			}
		th {
			height: 60px;
			}
	</style>
</head>
<body style="background-color:powderblue;">
	<center>
		<h1 style="color:FireBrick;"> Home Page </h1>
		<br>
		<a href="add.jsp"> Add Student </a>
		<br> <br>

		<table border="2">
			<tr>
				<th> Rno </th>
				<th> Name </th>
			</tr>
	<%
		try
		{
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","system","abc123");
			String sql = "select * from student_11july21";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				int rno = rs.getInt(1);
				String name = rs.getString(2);
	%>
				<tr align="center">
					<td> <%= rno %> </td>
					<td> <%= name %> </td>
					<td> <a href="?drno=<%= rno %>" onclick="return confirm('r u sure ?')"> Delete </a></td>
				</tr>
	<%
			}
		}
		catch(SQLException e)
		{
			out.println("issue " + e);
		}
	%>
		</table>
	</center>
</body>
</html>