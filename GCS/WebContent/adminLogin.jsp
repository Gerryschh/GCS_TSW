<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,it.unisa.model.*"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>Area Riservata</title>
	<link rel="stylesheet" href="css/general.css">
	<link rel="stylesheet" href="css/login.css">
    <title>GCS</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
	<script type="text/javascript" src="js/formCheck.js"></script>
</head>
<body class="align">
  <div class="login">
	
    <header class="login__header">
      <h2 style="color:white;"><svg class="icon">
          <use xlink:href="#icon-lock" />
        </svg>Area Riservata</h2>
    </header>
		<form action="login" method="post"> 
      <div>
        <label for="username">E-mail</label>
        <input type="text" id="email" name="username" placeholder="admin" >
      </div>

      <div>
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="password">
      </div>

      <div>
        <input class="button" type="submit" value="Log-In" id="submit">
		</div>
		 <input type="hidden" name="action" value="admin">
		</form>
  </div>
  		

  <svg xmlns="http://www.w3.org/2000/svg" class="icons">

    <symbol id="icon-lock" viewBox="0 0 448 512">
      <path d="M400 224h-24v-72C376 68.2 307.8 0 224 0S72 68.2 72 152v72H48c-26.5 0-48 21.5-48 48v192c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V272c0-26.5-21.5-48-48-48zm-104 0H152v-72c0-39.7 32.3-72 72-72s72 32.3 72 72v72z" />
    </symbol>

  </svg>
</body>
</html>