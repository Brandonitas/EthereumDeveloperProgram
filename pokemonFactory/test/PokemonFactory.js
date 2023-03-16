const {expect} = require("chai")

describe("Pokemon contract", function() {
    it("Pokemon Factory should't have pokemons", async function() {
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();
        const pokemons = await hardhatPokemon.getAllPokemons();
        expect(pokemons.length).to.equal(0);
    });
})