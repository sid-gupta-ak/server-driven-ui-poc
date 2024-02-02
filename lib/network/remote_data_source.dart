import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:kodeco_networking/network/pokemon_client.dart';
import 'package:kodeco_networking/util/request_type.dart';

import '../models/result.dart';

class RemoteDataSource {
  RemoteDataSource._privateConstructor();

  static final RemoteDataSource _apiResponse = RemoteDataSource._privateConstructor();
  factory RemoteDataSource() => _apiResponse;

  PokemonClient client = PokemonClient(Client());

  Future<Result> getPokemons(offset) async {
    // print('Making the call to get pokemons');
    try {
      final response = await client.request(
          requestType: RequestType.GET, path: 'pokemon', parameter: offset);

      if (response.statusCode == 200) {
        return Result.success(json.decode(response.body));
      } else {
        return Result.error('List not available');
      }
    } catch (error) {
      return Result.error('Something went wrong');
    }
  }
}
