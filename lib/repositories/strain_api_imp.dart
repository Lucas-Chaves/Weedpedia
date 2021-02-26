import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/utils.dart';
import '../models/marijuana.dart';
import 'strain_api.dart';

class StrainApiImpl implements StrainApi {
  final String _baseUrl = baseUrl;

  @override
  Future<List<Marijuana>> getAllStrains() async {
    final url = '$_baseUrl/strains/search/all';
    final response = await http.get(url);
    Map<String, dynamic> responseMap = jsonDecode(response.body);
    final allStrains = responseMap.entries.map((e) {
      e.value['name'] = e.key;
      return Marijuana.fromJson(e.value);
    }).toList();
    return allStrains;
  }

  // @override
  // getDescrById(int id) {
  //   // TODO: implement getDescrById
  //   throw UnimplementedError();
  // }

  // @override
  // getEffectsById(int id) {
  //   // TODO: implement getEffectsById
  //   throw UnimplementedError();
  // }

  // @override
  // getFlavorById(int id) {
  //   // TODO: implement getFlavorById
  //   throw UnimplementedError();
  // }

  // @override
  // listAllEffect() {
  //   // TODO: implement listAllEffect
  //   throw UnimplementedError();
  // }

  // @override
  // listAllFlavors() {
  //   // TODO: implement listAllFlavors
  //   throw UnimplementedError();
  // }

  // @override
  // searchByEffect(String effect) {
  //   // TODO: implement searchByEffect
  //   throw UnimplementedError();
  // }

  // @override
  // searchByFlavor(String flavor) {
  //   // TODO: implement searchByFlavor
  //   throw UnimplementedError();
  // }

  // @override
  // searchByName(String name) {
  //   // TODO: implement searchByName
  //   throw UnimplementedError();
  // }

  // @override
  // searchByRace(Race race) {
  //   // TODO: implement searchByRace
  //   throw UnimplementedError();
  // }
}
