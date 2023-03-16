// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {

    struct Ability {
        string name;
        string description;
    }
    
    struct Pokemon {
        uint id;
        string name;
        Ability[] abilities;
        string[] types;
        string[] weaknesses;
    }

    
    mapping (uint => Pokemon) public pokemons;
    mapping (uint => address) public pokemonToOwner;
    mapping (address => uint) ownerPokemonCount;

    uint[] ids;

    event eventNewPokemon(string _name, uint _id);

    modifier validPokemon(string memory _name, uint _id) {
        require(_id > 0, 'Id must be greater than 0');
        require(bytes(_name).length > 2, "Name's length must be grater than 2");
        _;
    }
    
    function createPokemon(string memory _name, uint _id) public validPokemon(_name, _id){
        pokemons[_id].name = _name;
        pokemons[_id].id = _id;
        ids.push(_id);
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name, _id);
    }

    function addAbilityToPokemon(string memory _abilityName, string memory _abilityDescription, uint _pokemonId) public {
        pokemons[_pokemonId].abilities.push(Ability(_abilityName, _abilityDescription));
    }

    function addPokemonTypeToPokemon(string memory _typeName, uint _pokemonId) public {
        pokemons[_pokemonId].types.push(_typeName);
    }

    function addWeaknessToPokemon(string memory _weaknessName, uint _pokemonId) public {
        pokemons[_pokemonId].weaknesses.push(_weaknessName);
    }    

    function getAllPokemons() public view returns (Pokemon[] memory) {
        Pokemon[] memory temporalPokemons = new Pokemon[](ids.length);
        for(uint i = 0; i < ids.length; i++){
            temporalPokemons[i] = pokemons[ids[i]];
        }
        return temporalPokemons;
    }

    function getPokemonById(uint _pokemonId) public view returns(Pokemon memory){
        require(_pokemonId > 0, "Invalid Id");
        return pokemons[_pokemonId];
    }

    function getResult() public pure returns(uint product, uint sum){
        uint a = 1; 
        uint b = 2;
        product = a * b;
        sum = a + b; 
    }
}