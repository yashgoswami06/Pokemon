package pokemon;

public class PokemonBean {
	  private int pokeId;
      private String name;
      private String description;
      private String catagory;
      private String abilities;
      private String gender;
   
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAbilities() {
		return abilities;
	}
	public void setAbilities(String abilities) {
		this.abilities = abilities;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getPokeId() {
		return pokeId;
	}
	public void setPokeId(int pokeId) {
		this.pokeId = pokeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCatagory() {
		return catagory;
	}
	public void setCatagory(String catagory) {
		this.catagory = catagory;
	}
      
}
