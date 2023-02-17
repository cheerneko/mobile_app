import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyPokemonApp());
}

class MyPokemonApp extends StatefulWidget { //stateful
  MyPokemonApp({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _MyPokemonApp();
  }
}

class _MyPokemonApp extends State<MyPokemonApp> {
  Map<int, Color> shadeColor = {
    // make shade color
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  };
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PokemonService(),
      child: Consumer<PokemonService>(
      builder: (_, pokemonService, __) {
        return MaterialApp(
          title: 'Pokemon Demo',
          theme: ThemeData(
          primarySwatch: MaterialColor(pokemonService.pokeColor, shadeColor),
        ),
        home: const MyBottomNavigation(),); 
      },
      ),
      );
  }
}