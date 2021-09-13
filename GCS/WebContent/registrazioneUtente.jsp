<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<script src="scripts/jquery.js"></script>
		<script type="text/javascript" src="js/formCheck.js"></script>
		<title>GCS</title>
		<link href="css/general.css" rel="stylesheet">
		<link href="css/container.css" rel="stylesheet">
		<link rel="icon" type="image/png" href="https://imgur.com/oSYDjIu.png">
	</head>
	<body>
		<div id="container">
		<%@include file="fragments/header.jsp" %>
		<%@include file="fragments/navigationBar.jsp" %>
			<div id="content">
				<h2>REGISTRAZIONE UTENTE</h2>
				<form action="login" method="post">
				<table id="tab1" cellspacing="40px">
				<tr>
					<th>Nome</th>
					<th>Cognome</th>
				</tr>
					<tr>
						<td><input id="name" name="name" type="text" placeholder="Mario" required onblur="checkNome(this.form.name)"><div id="nomeDiv"></td>
						<td><input id="surname" name ="surname" type="text" placeholder="Rossi" required onblur="checkCognome(this.form.surname)"><div id="cognomeDiv"></td>
					</tr>
				</table>
				<br>
				<table id="tab1" cellspacing="40px">
					<tr>
						<th>E-Mail</th>
						<th>Password</th>
					</tr>
					<tr>
						<td><input id="email" name="email" type="text" placeholder="mrossi@gmail.com" required onblur="checkEmail(this.form.email)"></td>
						<td><input id="pw" name="pw" type="password" placeholder="password" required></td>
					</tr>
				</table>
				<br>
				<table id="tab1" cellspacing="40px">
					<tr>
						<th>Numero Carta</th>
						<th>Data Scadenza</th>
						<th>CVV</th>
						<th>Indirizzo</th>
						<th>Telefono</th>
					</tr>
					<tr>
						<td><input id="PAN" name="PAN" type="text" placeholder="xxxx-xxxx-xxxx-xxxx" required minlength="16" maxlength="16" ></td>
						<td><input id="expDate" name="expDate" type="text" placeholder="MM/AA" required></td>
						<td><input id="CVV" name="CVV" type="text" placeholder="xxx" required minlength="3" maxlength="3"></td>
						<td><input id="address" name="address" type="text" placeholder="Via Guglielmo Marconi, 14" required></td>
						<td><input id="tel" name="tel" type="text" placeholder="3334567891" required onblur="checkTelefono(this.form.address)"></td>
					</tr>
				</table><br>
				<table id="tab1" cellspacing="40px">
					<tr>
						<td><input type="submit" id="butt"></td>
						<td> <input type="reset" id="butt"></td>
					</tr>
				</table>
				
				<input type="hidden" name="action" value="registration">
				</form>
			</div>
		</div>
	<%@include file="fragments/footer.jsp" %>
	</body>
</html>