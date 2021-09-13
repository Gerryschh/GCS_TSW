<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "a" %>
	<% 
	Collection<?> products = (Collection<?>) request.getAttribute("trovati");
	if(products == null) {
		response.sendRedirect("product");	
		return;
	}
	%>
<!DOCTYPE html>
<html>
	<head>
		<title>GCS</title>
		<link rel="stylesheet" href="<a:url value="/css/general.css"/>">
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
						</a>
					</div>
				<%
					}
				}
				%>	
				
			</div>
		</div>
		<%@include file="fragments/footer.jsp" %>
	</body>
</html>