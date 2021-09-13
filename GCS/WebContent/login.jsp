<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Log-In</title>
	<link rel="stylesheet" href="css/general.css">
	<link rel="stylesheet" href="css/login.css">
    <title>GCS</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/formCheck.js"></script>
	<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
</head>
<body class="align">
	<%
		UserBean currentUser = (UserBean) session.getAttribute("currentSessionUser");
		if (currentUser!=null&&(currentUser.isValid())){
	%>	
		<script>
		</script>
	<%
		}
	%>
		<script>
		$(document).ready(function(){
            $('#submit').click(function(){   
                var user=$('#email').val();
                var pwd=$('#password').val();
                $.ajax({
                    type: "GET",
                    url:"login?action=login",
                    data: {
                    	un: user,
                    	pw:pwd
                    },
                    success: function (data) {
                    	if(data=="[object Object]"){
                    		window.location=document.referrer;
                    	}
                    	else{	
                    		$('#utenteNonValido').html("Email e/o password non validi");
                    		$('#utenteNonValido').css("color", "red");
                    	}
                    }
                });                                
            });
        });
		</script>
  <div class="login">

    <header class="login__header">
      <h2 style="color:white;"><svg class="icon">
          <use xlink:href="#icon-lock" />
        </svg>Log-In</h2>
    </header>

      <div>
        <label for="email">E-mail</label>
        <input type="email" id="email" name="email" placeholder="mail@address.com" onblur="checkEmail(document.getElementById('email'))"><div id="emailDiv"></div>
      </div>

      <div>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="password">
      </div>
		<div id="utenteNonValido"></div>
      <div>
        <input class="button" type="submit" value="Log-In" id="submit">
		<a href="registrazioneUtente.jsp">Registrati</a>
		</div>
  </div>
  		

  <svg xmlns="http://www.w3.org/2000/svg" class="icons">

    <symbol id="icon-lock" viewBox="0 0 448 512">
      <path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" />
    </symbol>

  </svg>

</body>
</body>
</html>