<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
	
<% UserBean user = (UserBean) request.getSession().getAttribute("currentSessionUser"); %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="css/container.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
		<title>Riepilogo Ordine</title>
	</head>

	<body>
		<div id="container">
			<%@include file="fragments/header.jsp" %>
			<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
			<h2>DETTAGLI UTENTE</h2>
				<table id="tab1">
				<tr>
					<th>Nome: </th>
					<th>Cognome: </th>
					<th>Email: </th>
					<th>Indirizzo Spedizione: </th>
					<th>PAN: </th>
					<th>Scadenza: </th>
				</tr>
				<tr>
					<td><%=user.getFirstName()%></td>
					<td><%=user.getLastName()%></td>
					<td><%=user.getEmail()%></td>
					<td><%=user.getAddress()%></td>
					<td><%=user.getPAN()%></td>
					<td><%=user.getExpDate()%></td>
				</tr>
				</table><br>
				<h2>DETTAGLI ORDINE</h2>
				<table id="tab2">
				<tr>
					<th>Nome:</th>
					<th>Quantità:</th>
					<th>Code:</th>
					<th>Prezzo Totale:</th>
					<th></th>
					
				</tr>
					<% List<ProductBean> prodcart = cart.getProducts(); 	
					   for(ProductBean beancart: prodcart) {
					%>
				<tr>
					<td><%=beancart.getName()%></td>
					<td><%=beancart.getCartQuantity()%></td>
					<td><%=beancart.getCode()%></td>
					<td><%=String.format("%.2f", beancart.getTot())%></td>
					<td><button id=butt><a id="elimina" href="cart?action=delete&id=<%=beancart.getCode()%>">Elimina</a></button></td>
				</tr>
				<%} %>
				</table>
				<br><br>
				<form method="get" action="order">
					<input type="hidden" name="action" value="conferma">
					<button type="submit" id="butt">Procedi all'ordine</button>
				</form>	
				<br>
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>	
	</body>
</html>