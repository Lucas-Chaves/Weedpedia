import '../models/marijuana.dart';

abstract class StrainApi {
  Future<List<Marijuana>> getAllStrains();
  // listAllEffect();
  // listAllFlavors();
  // searchByName(String name);
  // searchByRace(Race race);
  // searchByEffect(String effect);
  // searchByFlavor(String flavor);
  // getDescrById(int id);
  // getEffectsById(int id);
  // getFlavorById(int id);
}
