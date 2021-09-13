<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>

<%	
	Cart cart = (Cart) request.getSession().getAttribute("cart");
	if(cart==null){
		cart=new Cart();
	}
%>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value="/css/header.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/container.css"/>">
	<link rel="stylesheet" href="<c:url value="/css/general.css"/>">
	<title>GCS</title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
</head>

<script>
		$(document).ready(function() {
		    $("#search").keyup(function() {
		        var search = $(this).val();
		        if(search != '') {
		            $.ajax({
		                type : "GET",
		                url : "product?action=search",
		                data: {
		                	search:search
		                },
		                success : function(html) {
		                	html.forEach(item =>{
		                		let s = item.split(",");
		                		$("#results ul").append('<a style="color:black; text-decoration:none" href="/GCS/product?action=read&id='+s[1]+'"><li>'+ s[0] +'</li></a>');
		                	})
		                	console.log(html);
		                	$("#results").show();
		                }
		            });
		        }
		        else{
		        	$("#results").hide();
		        }
		    });
		    
		});
		
			$(window).resize(function(){
					$("#hamburger").show();
			        if ($(window).width() < 768) {  
			    	   $("#hamburger").click(function() {
								$( "#menu" ).slideDown("slow", function(){
							    	$( "#hamburger" ).hide();
									$( "#cross" ).show();
								});
						});
			    	   $("#cross").click(function() {
				    	   $("#menu").slideUp("slow", function(){
				    		    $("#hamburger" ).show();
								$( "#cross" ).hide();
							});
			    	   });
			        } 
			        else{
			        	$( "#menu" ).hide();
				    	$( "#hamburger" ).hide();
						$( "#cross" ).hide();
			        }
			});
</script>

<header>
		<div id="logo"><a href="index.jsp"><img src="<c:url value="/images/nuovo/logo.png"/>"></a></div>
   		<div id="searchbar">
        <form method=get action="/GCS/product">
          <input name="s" type="text" id="search"><button id="sub">cerca</button>
          <input type="hidden" name="action" value="ricerca">
        </form>
        <div id="results">
          <ul>
          </ul>
        </div>
 </div>
		<div id="userLogged">
			<%
	 			UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
				if (currentUser!=null&&(currentUser.isValid())){
				    %>Ciao, <%=currentUser.getFirstName()%><%
				}
			%>		
		</div>
		<div id="bottoniera">				
	   		<div id="bottone_utente">
	   			<%
				if ((currentUser!=null) &&(currentUser.isValid())){
				%><a href="userLogged.jsp">
				<%
				}else{
				%><a href="login.jsp">
				<%}%>
				<img src="<c:url value="/images/nuovo/user.png"/>"></a></a>
			</div>
			<div id="bottone_carrello">
				<a href="cart?action=Cart"><img src="<c:url value="/images/nuovo/cart2.png"/>"></a>
			</div>
			<button id="hamburger">&#9776;</button>
			<div id="cartQuantity">(<%=cart.getTotalQuantity() %>)</div>
			
  			<button id="cross">&#735;</button>
		</div> 
</header>

<div id="menu">
  <ul>
    <li><a href="category.jsp?nome=componentiPC">Componenti PC</a></li>
    <li><a href="category.jsp?nome=pcGaming">PC Gaming</a></li>
    <li><a href="category.jsp?nome=monitor">Monitor</a></li>
    <li><a href="category.jsp?nome=sedieGaming">Sedie Gaming</a></li>
    <li><a href="category.jsp?nome=periferiche">Periferiche</a></li>
    <li><a href="chiSiamo.jsp">Chi Siamo</a></li>
    <li><a href="CartView.jsp">Carrello</a></li>
    <li><a href="userLogged.jsp">Area Utente</a></li>
  </ul>
</div> 