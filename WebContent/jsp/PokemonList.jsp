<%@page import="pokemon.PokemonBean"%>
<%@page import="java.util.List"%>
<%@page import="pokemon.PokemonServiceImpl"%>
<%@page import="pokemon.PokemonServices"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<% String message = null;
   PokemonServices pokemon = new PokemonServiceImpl();
   List<PokemonBean> pokemonsList = pokemon.listOfAllPokemon();
		   
%>
<head>
<style type="text/css">
#pokemon {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#pokemon td, #pokemon th {
  border: 1px solid #ddd;
  padding: 8px;
}

#pokemon tr:nth-child(even){background-color: #f2f2f2;}

#pokemon tr:hover {background-color: #ddd;}

#pokemon th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
<meta charset="ISO-8859-1">
<script type="text/javascript">
function removeAndUpdate(id,action){
	document.master.action = "EditAndRemovePokemon.jsp?action="+action+"&id="+id;
	document.master.submit();
}
</script>
<title>Pokemons</title>
</head>
<body>
<center>
   <form action="" name="master" method="post">
     <table id="pokemon">
        <tr>
         <td align="right" colspan="6"><a href="<%=request.getContextPath()%>/index.jsp">Home</a></td>
        </tr>
        <tr>
           <td colspan="6" align="center"><h2>Pokedex</h2></td>
        </tr>
     	<% if( pokemonsList.size() == 0){ %>
        <tr>
        	<td colspan="6">You dont have any Pokemon Do you want to <a href="AddPokemon.jsp">Add Pokemon</a> ?</td>
        </tr>
        <%}else{%>
        <tr><input type="hidden" value="" name="action_type" id="action_type"></tr>
        <tr>
        <th>Name</th>
        <th>Catagory</th>
        <th>Abilities</th>
        <th>Description</th>
        <th>Edit</th>
        <th>Remove</th>
        </tr>
        <%}for(int index=0; index<pokemonsList.size(); index++ ){ 
        PokemonBean pb = pokemonsList.get(index);
        %>
        <tr>
        <td colspan="1"><%= pb.getName() %><input type="hidden" name="name<%=pb.getPokeId()%>" value="<%= pb.getName() %>"></td>
        <td colspan="1"><%= pb.getCatagory() %><input type="hidden" name="catagory<%=pb.getPokeId()%>" value="<%= pb.getCatagory() %>"></td>
        <td colspan="1"><%= pb.getAbilities() %><input type="hidden" name="abilities<%=pb.getPokeId()%>" value="<%= pb.getAbilities() %>"></td>
        <td colspan="1"><%= pb.getDescription() %><input type="hidden" name="description<%=pb.getPokeId()%>" value="<%= pb.getDescription() %>"></td>
        <td colspan="1"><a href="javascript: removeAndUpdate(<%=pb.getPokeId()%>,'edit')">Edit</a></td>
        <td colspan="1"><a href="javascript: removeAndUpdate(<%=pb.getPokeId()%>,'remove')">Remove</a></td>
        </tr>
        <%} %>
     </table>
   </form>
</center>
</body>
</html>