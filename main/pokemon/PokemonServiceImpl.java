package pokemon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PokemonServiceImpl implements PokemonServices {
	
	@Override
	public String addPokemon(PokemonBean pokemonBean) throws SQLException, Exception {
		String response = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(PokemonSQL.ADD_POKEMON);
			
			
			ps.setString(1, pokemonBean.getName());
			ps.setString(2, pokemonBean.getCatagory());
			ps.setString(3, pokemonBean.getAbilities());
			ps.setString(4, pokemonBean.getDescription());
			int count= ps.executeUpdate();
			
			response = count > 0 ? "Pokemon Added In Your Pokedex" : "Can not add Pokemon";
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( con != null ) con.close();
				if( ps != null ) ps.close();
				if( rs != null ) rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return response;
	}

	@Override
	public List<PokemonBean> listOfAllPokemon() throws SQLException,Exception{
		
		ArrayList<PokemonBean> listOfPokemon = new ArrayList<PokemonBean>();
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(PokemonSQL.LIST_OF_ALL_POKEMON_SQL);
			
			while( rs.next() ) {
				PokemonBean bean = new PokemonBean();
				
				bean.setPokeId(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setCatagory(rs.getString(3));
				bean.setAbilities(rs.getString(4));
				bean.setDescription(rs.getString(5));
				listOfPokemon.add(bean);
			}
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( con != null ) con.close();
				if( stmt != null ) stmt.close();
				if( rs != null ) rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return listOfPokemon;
	}

	@Override
	public String removePokemon(int idOfPokemon) throws SQLException, Exception {
		
		String response = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(PokemonSQL.REMOVE_POKEMON);
			
			ps.setInt(1,idOfPokemon);
			
			int count= ps.executeUpdate();
			
			response = count > 0 ? "Pokemon removed" : "Can not remove Pokemon";
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( con != null ) con.close();
				if( ps != null ) ps.close();
				if( rs != null ) rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return response;
	}

	@Override
	public String editPokemon(PokemonBean pokemonBean) throws SQLException, Exception {
		String response = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(PokemonSQL.UPDATE_POKEMON);
			
			
			ps.setString(1, pokemonBean.getName());
			ps.setString(2, pokemonBean.getCatagory());
			ps.setString(3, pokemonBean.getAbilities());
			ps.setString(4, pokemonBean.getDescription());
			ps.setInt(5,pokemonBean.getPokeId());
			int count= ps.executeUpdate();
			
			response = count > 0 ? "Pokemon Updated Sucessfully" : "Can not update Pokemon";
			
		}catch (SQLException sqle) {
			sqle.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if( con != null ) con.close();
				if( ps != null ) ps.close();
				if( rs != null ) rs.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return response;
	}

}
