<%@ page import="it.unisa.model.*"
     import="java.util.Collection"
     import="java.util.Iterator"
%>

<% Collection<?> products = (Collection<?>) request.getSession().getAttribute("products"); %>
  
<!DOCTYPE html>
<html>
	<head>
		<link href="css/container.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
		<title>GCS</title>
	</head>
	<body>
	<div id="container">
	<%@include file="fragments/header.jsp" %>
	<%@include file="fragments/navigationBar.jsp" %>
		<div id="content">
		<h2>DETTAGLI ORDINE</h2>
				<table cellspacing="40px" id="tab1">
					<tr>
						<th>Codice</th>
						<th>Nome</th>
						<th>Descrizione</th>
						<th>Prezzo Unitario</th>
						<th>Quantità</th>
						<th>Prezzo Totale articolo</th>
				
					</tr>
					<%
						if (products != null && products.size() != 0) {
							Iterator<?> it = products.iterator();
							while (it.hasNext()) {
								ProductBean product = (ProductBean) it.next();
					%>
					<tr>
						<td><%=product.getCode()%></td>
						<td><%=product.getName()%></td>
						<td><%=product.getDescription()%></td>
						<td><%=product.getPrice()%></td>
						<td><%=product.getQuantity()%></td>
						<td><%=product.getPrice()*product.getQuantity()%></td>
					</tr>
					<%}}%>
				</table>
				</div>
	</div>
	<%@include file="fragments/footer.jsp" %>	
	</body>
</html>