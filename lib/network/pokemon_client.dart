import 'dart:convert';

import 'package:http/http.dart';

import '../util/nothing.dart';
import '../util/request_type.dart';

class PokemonClient {
  static const String _baseUrl = 'https://pokeapi.co/api/v2';

  final Client _client;

  PokemonClient(this._client);

  Future<Response> request(
      {required RequestType requestType,
      required String path,
      dynamic parameter = Nothing}) async {
    switch (requestType) {
      case RequestType.GET:
        int offset = parameter == Nothing ? 0 : parameter as int;
        return _client.get(Uri.parse('$_baseUrl/$path?offset=$offset'));

      case RequestType.POST:
        return _client.post(
          Uri.parse('$_baseUrl/$path'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(parameter),
        );

      default:
        return throw Exception('Request method not found');
    }
  }
}
