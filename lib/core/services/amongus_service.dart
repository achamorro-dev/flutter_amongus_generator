import 'package:http/http.dart' as http;

import 'package:amongus_generator/core/models/amongus_character.dart';

const String RANDOM_CHARACTER_URL =
    'http://localhost:5001/amongus-generator/us-central1/generateRandomCharacter';

class AmongUsService {
  Future<AmongUsCharacter> generateRandomCharacter() async {
    var response = await http.get(RANDOM_CHARACTER_URL);
    return amongUsCharacterFromJson(response.body);
  }
}
