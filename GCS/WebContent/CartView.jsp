<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,it.unisa.model.ProductBean,it.unisa.model.Cart"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
		<title>GCS</title>
	</head>

	<body>
		<div id="container">   
			<%@include file="fragments/header.jsp" %>
			<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
				<div class="box_container">
				<% if(cart != null && cart.getSize()!=0) { 
					List<ProductBean> prodcart = cart.getProducts(); 	
					for(ProductBean beancart: prodcart) {
				%>
						<div id="product">
							<div id="cartImage" class="prod">
								<img src="<%=beancart.getThumbnail()%>" alt="IMG">
							</div>
							<div id="product_nome" class="prod"><%=beancart.getName()%></div>
							<div id="product_quantita" class="prod">
								<form action="cart">
									<input type="hidden" name="action" value="increaseQ">
									<input type="hidden" name="id" value="<%=beancart.getCode()%>">
									<input type="submit" id="butt" value="+" >
								</form>
								<%=beancart.getCartQuantity()%>
								<form action="cart">
									<input type="hidden" name="action" value="decreaseQ">
									<input type="hidden" name="id" value="<%=beancart.getCode()%>">
									<input type="submit" id="butt" value="-" >
								</form>
							</div>
							<div id="product_totale" class="prod"><%=String.format("%.2f", beancart.getTot())%></div>
							<div id="product_delete" class="prod"><a href="cart?action=delete&id=<%=beancart.getCode()%>">Delete from cart</a></div>
						</div>
					<%}%>
			
					<h2>Prezzo totale:  <%=String.format("%.2f", cart.getTotPrice())%>€</h2>
					<br/><br/><a href="order?action=checkout">
						<input type="submit" id="butt" name="submit" value="Checkout"></a>
					<% } else { %>	
						<h2>Il tuo carrello è vuoto</h2>
					<% } %>
					
				</div>
			</div>
		</div>	
		<%@include file="fragments/footer.jsp" %>	
	</body>
</html>