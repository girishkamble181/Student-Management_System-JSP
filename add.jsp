<%@ page import="java.sql.*"%>

<html>
<head>
	<title> Student CRUD by GK </title>
	<style>
		*{ font-size: 30px; }
	</style>
</head>

<body style="background-color:powderblue;">
	<center>
		<h1 style="color:FireBrick;"> Add Student Page </h1>
		<br>
		<a href="index.jsp"> Home </a>
		<br><br>
		<form method="POST" action="add.jsp">
			<input type="number" name="r" placeholder="enter rno" required>
			<br><br>
			<input type="text" name="n" placeholder="enter name" required>
			<br><br>
			<input type="submit" name="b1">
			<input type="reset" name="b2">
			<br><br>
		</form>
		<%
			if (request.getParameter("b1") != null)
			{
				int rno = Integer.parseInt(request.getParameter("r"));
				String name = request.getParameter("n");

				try
				{
					DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ORCL","system","abc123");
					String sql = "insert into student_11july21 values(?, ?)";
					PreparedStatement pst = con.prepareStatement(sql);
					pst.setInt(1, rno);
					pst.setString(2, name);
					pst.executeUpdate();
					out.println("record added");

		%>
			<script>
				alert("record added thank u")
			</script>
		<%
				}
				catch(SQLException e)
				{
					out.println("issue " + e);
				}
			}
		%>
	</center>
</body>
</html>