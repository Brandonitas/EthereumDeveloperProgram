const {expect} = require("chai")

describe("Pokemon contract", function() {
    it("Pokemon Factory should't have pokemons", async function() {
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();

        const pokemons = await hardhatPokemon.getAllPokemons();
        expect(pokemons.length).to.equal(0);
    });

    it("Pokemon Factory should have pokemons", async function() {
        const PokemonFactory = await ethers.getContractFactory("PokemonFactory");
        const hardhatPokemon = await PokemonFactory.deploy();

        await hardhatPokemon.createPokemon( "Pikachu", 1);
        await hardhatPokemon.createPokemon( "Charizard", 2);

        const pokemons = await hardhatPokemon.getAllPokemons();
        expect(pokemons.length).to.equal(2);
    });
})

//Reto 
//https://github.com/gelopfalcon/solidity-eth-challenge/blob/main/Retos.md