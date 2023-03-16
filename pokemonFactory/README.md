## PokemonFactory

## Reto #1
Investigar que son los Events en Solidity. Luego, debes implementar un evento que se llame eventNewPokemon, el cual se disparará cada vez que un nuevo Pokemon es creado.  Lo que emitirá el evento será el Pokemon que se creó. 

### Solución
Los events en solidity son una forma de registrar información sobre las transacciones y las operaciones que ocurren en un contrato inteligente. Se utilizan para enviar notificaciones a los clientes del lado del frontend. 
```solidity
    event eventNewPokemon(string _name, uint _id);

    function createPokemon(string memory _name, uint _id) public validPokemon(_name, _id){
        pokemons[_id].name = _name;
        pokemons[_id].id = _id;
        ids.push(_id);
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit eventNewPokemon(_name, _id);
    }
```

## Reto #2

- Investigar sobre “”require” .
- Entonces, antes de agregar un nuevo Pokemon,  se debe validar que el id sea mayor a 0. De lo contrario, se debe desplegar un mensaje que corrija al usuario.
- Entonces, antes de agregar un nuevo Pokemon,  se debe validar que el name no sea vació y mayor a 2 caracteres. De lo contrario, se debe desplegar un mensaje que corrija al usuario.

## Reto #3
Los Pokemons han evolucionado, ahora tienen una lista de habilidades (Habilities). Es decir, un Pokemon puede tener 1 ó muchas habilidades, cada habilidad tiene el siguiente formato:
- Name
- Description 


## Reto #4 - Estudiante Super Sayayin
Los Pokemons  pueden pertenecer a más de un tipo (Type), por ejemplo: Bulbasaur es de tipo Grass y Poison. Proponga una solución e impleméntela. 

Los Pokemons  tienen debilidades (Weaknesses) las cuales pueden ser otros tipos de pokemones. Por ejemplo,  Bulbasaur es débil contra pokemones de tipo Fire, Flying, Ice, Psychic. Proponga una solución e impleméntela.

 
## Reto #5 - Estudiante Sayayin Blue
Crear los siguientes test:

- Un test que agregue 2 pokemons y valide que tenga esa cantidad de pokemons dentro de la fábrica.
