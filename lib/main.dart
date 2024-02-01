import 'package:flutter/material.dart';
import 'package:kodeco_networking/ui/screens/dynamic_screen.dart';
import 'package:kodeco_networking/ui/screens/pokemon_screen.dart';

import 'ui/screens/dynamic_screen_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: PokemonScreen(),
        home: Scaffold(
      body: CustomScrollView(
        slivers: [
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list.json',
          ),
          DynamicScreen(
            assetFile: 'assets/json/infinite_list_2.json',
          ),

          // SizedBox(
          //   height: 32,
          //   child: Container(
          //     color: Colors.black54,
          //   ),
          // ),
          // Expanded(child: DynamicScreen2())
        ],
      ),
    ));
  }
}
