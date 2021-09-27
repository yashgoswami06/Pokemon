<%@page import="pokemon.PokemonBean"%>
<%@page import="pokemon.PokemonServiceImpl"%>
<%@page import="pokemon.PokemonServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<% String message = null;
   int id = Integer.parseInt(request.getParameter("id"));
   String action = request.getParameter("action");
   PokemonServices pokemon = new PokemonServiceImpl();
%>
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
<script type="text/javascript">
function update(){
	document.master.action = "EditAndRemovePokemon.jsp?action=update";
	document.master.submit();
}
</script>
<meta charset="ISO-8859-1">
<title>Remove Pokemon</title>
</head>
<body>
<center>
    <%if(action.equalsIgnoreCase("remove")){
	    message = pokemon.removePokemon(id);
    	%>
    
    <h1 style="font-family: verdana;"><%=message %></h1>
    Pokemon in you <a href="PokemonList.jsp">Pokedex</a>
    <%}else if(action.equalsIgnoreCase("add")){
    	PokemonBean pokemonBean = new PokemonBean();	
    	pokemonBean.setName(request.getParameter("Name"));
    	pokemonBean.setAbilities(request.getParameter("Abilities"));
    	pokemonBean.setCatagory(request.getParameter("Catagory"));
    	pokemonBean.setDescription(request.getParameter("Description"));
    	
        message = pokemon.addPokemon(pokemonBean);
    
    %>
    <h1 style="font-family: verdana;"><%=message %></h1>
    Pokemon in you <a href="PokemonList.jsp">Pokedex</a>
    <%}else if(action.equalsIgnoreCase("update")){
    	PokemonBean pokemonBean = new PokemonBean();	
    	pokemonBean.setPokeId(Integer.parseInt(request.getParameter("id")));
    	pokemonBean.setName(request.getParameter("Name"));
    	pokemonBean.setAbilities(request.getParameter("Abilities"));
    	pokemonBean.setCatagory(request.getParameter("Catagory"));
    	pokemonBean.setDescription(request.getParameter("Description"));
    	
        message = pokemon.editPokemon(pokemonBean);
    
    %>
    <h1 style="font-family: verdana;"><%=message %></h1>
    Pokemon in you <a href="PokemonList.jsp">Pokedex</a>
    <%}else{%>
    <div>
       <form action="" method="post" name="master">
         <h1 style="font-family: verdana;">Edit Pokemon</h1>
         <label for="name" >Pokemon Name</label>
         <input type="text" id="Name" name="Name" value="<%= request.getParameter("name"+id)%>">
         <input type="hidden" name="id" value="<%=id%>"> <br>
         <label for="Catagory" >Catagory</label>
         <input type="text" id="Catagory" name="Catagory" value="<%= request.getParameter("catagory"+id)%>"><br>
         <label for="Abilities" >Abilities</label>
         <input type="text" id="Abilities" name="Abilities" value="<%= request.getParameter("abilities"+id)%>"><br>
         <label for="Description" >Description</label>
         <textarea id="Description"  name="Description" rows="4" cols="50"><%= request.getParameter("description"+id)%></textarea><br>
         <a href="PokemonList.jsp">Cancel</a>&emsp;
         <a href="javascript: update()">Update</a>
       </form>
     </div>  
    <%} %>
</center>
</body>
</html>