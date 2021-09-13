<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.ProductDAO"%>
	<%
		ProductBean product = ProductDAO.doRetrieveByKey(Integer.parseInt(request.getParameter("id")));
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
		<h2 style="color: #BE4F0C">MODIFICA PRODOTTO</h2>
		<form action="../product" method="post">
			<input type="hidden" name="action" value="modify">
			<input type="hidden" name="id" value="<%=request.getParameter("id")%>">
			<table style="width: 100%; border: 2px solid #BE4F0C;">
			<tr>
				<th><label for="nome">Nome:</label></th>
				<th><label for="descrizione">Descrizione:</label></th>
				<th><label for="prezzo">Prezzo:</label></th>
				<th><label for="quantità">Quantità:</label></th>
				<th><label for="sconto">Sconto:</label></th>
				<th><label for="iva">IVA:</label></th>
				<th><label for="iva">Categoria:</label></th>
			</tr>
			<tr>
				<td><input name="nome" type="text" maxlength="20" required value="<%=product.getName()%>"></td>
				<td><textarea name="descrizione" maxlength="100" rows="5" required><%=product.getDescription()%></textarea></td>
				<td><input name="prezzo" type="number" min="0" step="0.01" required value="<%=product.getPrice()%>"></td>
				<td><input name="quantita" type="number" min="1" required value="<%=product.getQuantity()%>"></td>
				<td><input name="sconto" type="number" min="0" step="0.01" required value="<%=product.getSconto()%>"></td>
				<td><input name="iva" type="number" min="0" step="0.1" required value="<%=product.getIva()%>"></td>
				<td><input name="categoria" type="text" maxlength="20" required value="<%=product.getCategoria()%>"></td>
			</tr>
		</table>
		<br><br>
		<input type="submit" value="Modifica" id="butt"> <input type="reset" value="Reset" id="butt">
		</form>
		</div>
	</div>
	<%@include file="../fragments/footer.jsp" %>
	</body>
</html>