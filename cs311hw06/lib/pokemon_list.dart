import 'package:cs311hw06/pokemon_detail.dart';

import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonList();
}
  class _PokemonList extends State<PokemonList> {
    int choose_pokemon = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  choose_pokemon =index+1;
                  pokemonService.typePokemon(index+1);
                });
              },child:(
                choose_pokemon == index+1
                ? Container(child: Image.network(genPokemonImageUrl(index+1)),
                decoration: BoxDecoration(border: Border.all(width: 7)),)
                :Image.network(genPokemonImageUrl(index+1))
                )
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
