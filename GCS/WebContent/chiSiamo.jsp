<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<head>
	<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
</head>
<%@include file="fragments/header.jsp" %>
<%@include file="fragments/navigationBar.jsp" %>
<div id="chiSiamo">
	<div id="chiSiamo">
		<h1>CHI SIAMO</h1>
	</div>
	<br>
	<table id="chis">
		<tr>
			<td><img src="<c:url value="/images/ChiSiamo/gerardo.jpg"/>" id="Gerry"></td>
			<td><img src="<c:url value="/images/ChiSiamo/michelangelo.png"/>" id="Miche"></td>
		</tr>
		<tr>
			<td><h1>GERARDO</h1></td>
			<td><h1>MICHELANGELO</h1></td>
		</tr>
		<tr>
			<td><h2>CEO & FOUNDER</h2></td>
			<td><h2>CEO & FOUNDER</h2></td>
		</tr>
	</table>
	
	<h3 id="descrCS">
	"GCS, acronimo di Gaming Component Sale, si offre come una nuova realtà di e-commerce per il sempre più dilagante mondo del gaming e
	per chi vuole prenderne parte. La finalità è quella di proporre un'ampia varietà di componenti informatici dediti alla sfera videoludica, destinati
	a qualsiasi tipo di giocatore."
	</h3>
</div>
<%@include file="fragments/footer.jsp" %>