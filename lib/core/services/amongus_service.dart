import 'package:http/http.dart' as http;

import 'package:amongus_generator/core/models/amongus_character.dart';

const String RANDOM_CHARACTER_URL =
    'https://us-central1-amongus-generator.cloudfunctions.net/generateRandomCharacter';

class AmongUsService {
  Future<AmongUsCharacter> generateRandomCharacter() async {
    var response = await http.get(RANDOM_CHARACTER_URL);
    return amongUsCharacterFromJson(response.body);
  }
}
