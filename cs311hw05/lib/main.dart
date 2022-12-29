import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(150, (i) => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i+1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;
  const MyApp({super.key, required this.items});
  @override
  State<StatefulWidget> createState() {
    return _FavoriteWidgetState(items: items);
  }
}

class _FavoriteWidgetState extends State<MyApp> {
  final List<String> items;
  List<bool> isfavorite = List<bool>.generate(150, (index) => false);
  int countfavorite = 0;
  _FavoriteWidgetState({required this.items});
  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: countfavorite == 0 ?Text(title):Text(title + '($countfavorite)'),
        ),
        body: ListView.builder(
          itemCount: items.length ~/ 3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: Stack( // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(items[index*3]),
                    IconButton(iconSize: 50,onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3] == false) {
                          isfavorite[index*3] = true;
                          countfavorite += 1;
                          //print(isfavorite);
                        } else {
                          isfavorite[index*3] = false;
                          countfavorite -= 1;
                        }
                      });
                    }),
                     icon: (isfavorite[index*3] ?Icon(Icons.favorite_rounded, color: Colors.red.shade500,):Icon(Icons.favorite_border,)))
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+1]),
                    IconButton(iconSize: 50,onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3+1] == false) {
                          isfavorite[index*3+1] = true;
                          countfavorite += 1;
                          //print(isfavorite);
                        } else {
                          isfavorite[index*3+1] = false;
                          countfavorite -= 1;
                        }
                      });
                    }),
                     icon: (isfavorite[index*3+1] ?Icon(Icons.favorite_rounded, color: Colors.red.shade500,):Icon(Icons.favorite_border,)))
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+2]),
                    IconButton(iconSize: 50,onPressed: (() {
                      setState(() {
                        if(isfavorite[index*3+2] == false) {
                          isfavorite[index*3+2] = true;
                          countfavorite += 1;
                          //print(isfavorite);
                        } else {
                          isfavorite[index*3+2] = false;
                          countfavorite -= 1;
                        }
                      });
                    }),
                     icon: (isfavorite[index*3+2] ?Icon(Icons.favorite_rounded, color: Colors.red.shade500,):Icon(Icons.favorite_border,)))
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  } 
  }

