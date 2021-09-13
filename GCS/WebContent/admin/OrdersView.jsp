<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%
	Collection<?> orders =null;
	if(request.getAttribute("orders")!=null){
		orders= (Collection<?>) request.getAttribute("orders");
	}
	else orders = (Collection<?>) OrderDAO.doRetrieveAll(null);
// Check user credentials
	Boolean adminRoles = (Boolean) session.getAttribute("adminRoles");
	if ((adminRoles == null) || (!adminRoles.booleanValue())){	
	    response.sendRedirect("../adminLogin.jsp");
	    return;
	}
%>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="../css/container.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
		<title>GCS</title>
	</head>



	<body>
	<div id="container">
	<%@include file="../fragments/header.jsp" %>
	<%@include file="../fragments/navigationBar.jsp" %>
		<div id="content">
			<h2 style="color: #BE4F0C">ORDINI</h2>
				<table align="center">
					<tr>
						<th>Code</th>
						<th>Data Effettuazione</th>
						<th>Prezzo Totale</th>
						<th>Utente</th>
					</tr>
					<%
						if (orders != null && orders.size() != 0) {
							Iterator<?> it = orders.iterator();
							while (it.hasNext()) {
								OrderBean bean = (OrderBean) it.next();
					%>
								<tr>
									<td><%=bean.getId() %></td>
									<td><%=bean.getDataEff()%></td>
									<td><%=bean.getPrezzoTot()%></td>
									<td><%=bean.getUtente()%></td>
								</tr>
					<%
							}
						}
						else {
					%>
					<tr>
						<td colspan="6">No orders available</td>
					</tr>
					<%
						}
					%>
				</table><br/>
			
			<h2 style="color: #BE4F0C">FILTRA ORDINI PER DATA:</h2>
			<table align="center">
			<tr>
				<th>INIZIO</th>
				<th>FINE</th>
			</tr>
			<tr>
				<form action="${pageContext.request.contextPath}/order" method="post">
					<input type="hidden" name="action" value="filterDate">
					<td><input type="text" name="inizio" placeholder="inizio yyyy-mm-dd"></td>
					<td><input type="text" name="fine" placeholder="fine yyyy-mm-dd"></td>
					<tr><td><input type="submit" value="Filtra" id="butt"></td><td><input type="reset" value="Reset" id="butt"></td></tr>
				</form></table><br/><br/>
				
			<h2 style="color: #BE4F0C">FILTRA ORDINI PER UTENTE:</h2>
			<table align="center">
				<form action="${pageContext.request.contextPath}/order" method="post">
					<input type="hidden" name="action" value="filterUser">
					<tr><th>EMAIL UTENTE</th></tr>
					<tr><td><input type="text" name="user" placeholder="mariorossi@gmail.com"></td></tr>
					<tr><td><input type="submit" value="Filtra" id="butt"> <input type="reset" value="Reset" id="butt"></td></tr>
				</form></table>
		</div>
	</div>
	<%@include file="../fragments/footer.jsp" %>
	</body>
</html>