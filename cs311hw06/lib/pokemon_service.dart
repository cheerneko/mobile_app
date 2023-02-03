import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  int pokemonType = 1;
  int pokeColor = 0xFF7AC74C; //Grass Pokemon color

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void typePokemon(int index) async {
    int pokemonType = index;
    PokemonInfo info = await fetchPokemonInfo(pokemonType); //fetch pokemon infomation
    String types = info.types[0]; //get the first type only
    //print(types);
    if(types == 'normal'){ //if pokemon is type normal
      pokeColor = 0xffA8A77A; //change color to this color-code
    }else if(types == 'fire'){
      pokeColor = 0xffEE8130;
    }else if(types == 'water'){
      pokeColor = 0xff6390F0;
    }else if(types == 'electric'){
      pokeColor = 0xffF7D02C;
    }else if(types == 'grass'){
      pokeColor = 0xff7AC74C;
    }else if(types == 'ice'){
      pokeColor = 0xff96D9D6;
    }else if(types == 'fighting'){
      pokeColor = 0xffC22E28;
    }else if(types == 'poison'){
      pokeColor = 0xffA33EA1;
    }else if(types == 'ground'){
      pokeColor = 0xffE2BF65;
    }else if(types == 'flying'){
      pokeColor = 0xffA98FF3;
    }else if(types == 'psychic'){
      pokeColor = 0xffF95587;
    }else if(types == 'bug'){
      pokeColor = 0xffA6B91A;
    }else if(types == 'rock'){
      pokeColor = 0xffB6A136;
    }else if(types == 'ghost'){
      pokeColor = 0xff735797;
    }else if(types == 'dragon'){
      pokeColor = 0xff6F35FC;
    }else if(types == 'dark type'){
      pokeColor = 0xff705746;
    }else if(types == 'steel type'){
      pokeColor = 0xffB7B7CE;
    }else{
      pokeColor = 0xffD685AD;
    }notifyListeners();
  }
}
