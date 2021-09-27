<%@page import="pokemon.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
input[type=text], select {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
a:link, a:visited {
  background-color: green;
  color: white;
  padding: 14px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: green;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

function add(){
	var error = document.getElementById("error");
	
	if( document.master.Name.value == "" ){
		error.innerHTML = "Please enter name of pokemon";
		return;
	}
	else if( document.master.Catagory.value == "" ){
		error.innerHTML = "Please enter Catagory of pokemon";
		return
	}
	error.innerHTML=""
	document.master.action = "EditAndRemovePokemon.jsp?action=add&id=1";
	document.master.submit();
}
</script>
<meta charset="ISO-8859-1">
<title>Add Pokemon</title>
</head>
<body style="font-family: verdana;">
<%
%>
<center>
   <div>
       <form action="" method="post" name="master">
         <h1 style="font-family: verdana;">Add Pokemon</h1>
         
         <input type="hidden" name="action_type" value="">
         <div id="error" style="color: red;"></div>
         <label for="name" >Pokemon Name</label>
         <input type="text" id="Name" name="Name" value="">
          <br>
         <label for="Catagory" >Catagory</label>
         <input type="text" id="Catagory" name="Catagory" value=""><br>
         
         <label for="Abilities" >Abilities</label>
         <input type="text" id="Abilities" name="Abilities" value=""><br>
         
         <label for="Description" >Description</label>
         <textarea id="Description"  name="Description" rows="4" cols="50"></textarea><br>
         
         <a href="PokemonList.jsp">Cancel</a>&emsp;
         <a href="javascript: add()">Add</a>
       </form>
     </div>
</center>
</body>
</html>