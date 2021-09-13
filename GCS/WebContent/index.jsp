<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>

<%
	
	Collection<?> prodotti = (Collection<?>) ProductDAO.doRetrieveAll();
	
%>

<!DOCTYPE html>
<html>
	<head>
		<title>GCS</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
	</head>

	<body>
		<div id="container">   
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
				<div id="content">
				<%@include file="fragments/carousel.jsp" %>
					
					<div><h1>PRODOTTI</h1></div>
					<div id="box_container" >
						<%
							if (prodotti != null && prodotti.size() != 0) {
								Iterator<?> it = prodotti.iterator();
								while (it.hasNext()) {
									ProductBean bean = (ProductBean) it.next();
						%>
								<div id="box" class="hvr-grow-shadow">
									<a href="product?action=read&id=<%=bean.getCode()%>">
										<div id="img">
											<img src="<%=bean.getThumbnail()%>" alt="IMG">
										</div>
										<div class="nome"><%=bean.getName()%></div>
										<div id="prezzo"><%=bean.getPrice()%>€</div>
									</a>
								</div>
						<%
								}
							}
						%>
					</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>