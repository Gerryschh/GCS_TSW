<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<%
	Collection<?> products = (Collection<?>) ProductDAO.doRetrieveProductsbyCategoria(request.getParameter("nome"));
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
%>


<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>GCS</title>
		<link rel="stylesheet" href="<c:url value="/css/container.css"/>">
		<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
	</head>
	<body>
		<div id="container">   
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
			<%
				if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						ProductBean bean = (ProductBean) it.next();
			%>
					<div id="box" class="hvr-grow-shadow">
						<a href="product?action=read&id=<%=bean.getCode()%>">
							<div id="img">
								<img src="<%=bean.getThumbnail()%>" alt="IMG">
							</div>
							<label class="nome"><%=bean.getName()%></label>
							<div id="prezzo"><%=bean.getPrice()%>€</div>
						</a>
					</div>
			<%
					}
				}
				else {
			%>
				
			<%
				}
			%>
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>	
	</body>
</html>