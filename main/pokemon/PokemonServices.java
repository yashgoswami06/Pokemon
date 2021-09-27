package pokemon;

import java.sql.SQLException;
import java.util.List;

public interface PokemonServices {
    //Added methods for diffrent operation of Pokemon 
	
	public abstract String addPokemon(PokemonBean pokemonBean) throws SQLException,Exception;
	
	public abstract List<PokemonBean> listOfAllPokemon() throws SQLException,Exception;
	
	public abstract String removePokemon(int idOfPokemon) throws SQLException,Exception;
	
	public abstract String editPokemon(PokemonBean pokemonBean) throws SQLException,Exception;
	
}
