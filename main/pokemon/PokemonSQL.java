package pokemon;

public interface PokemonSQL {
	//Added SQL queries for MultipleOperations of pokemon
	public static final String LIST_OF_ALL_POKEMON_SQL = "select * from pokemon";
	public static final String ADD_POKEMON = "insert into pokemon(name,catagory,abilities,description) values(?,?,?,?)";
	public static final String REMOVE_POKEMON = "delete from pokemon where id = ?";
	public static final String UPDATE_POKEMON = "update pokemon set name=?, catagory=?, abilities=?, description=? where id=?";
}
