import 'package:flutter/material.dart';
import 'package:kodeco_networking/models/result.dart';
import 'package:kodeco_networking/network/remote_data_source.dart';
import 'package:kodeco_networking/util/nothing.dart';

import '../widgets/paged_list_view.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  RemoteDataSource _apiResponse = RemoteDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemons list'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: _apiResponse.getPokemons(0),
              // note - this should not be here
              builder: (context, snapshot) {
                if (snapshot.data is SuccessState) {
                  var pokemons =
                      (snapshot.data as SuccessState).value['results'];
                  return Expanded(
                    child: ListView.builder(
                      itemCount: pokemons.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(pokemons[index]['name']),
                        );
                      },
                    ),
                  );
                } else if (snapshot.data is ErrorState) {
                  return Text('error');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Expanded(
                child: OwnPagedListView(
              apiResponse: _apiResponse,
            ))
          ],
        ),
      ),
    );
  }
}
