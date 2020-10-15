import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService _instance;
  static SharedPreferences _preferences;

  static const FAVORITES_KEY = 'favorites';

  static Future<SharedPreferencesService> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  List<String> get favorites {
    return _preferences.getStringList(FAVORITES_KEY);
  }

  set favorites(List<String> favorites) {
    _preferences.setStringList(FAVORITES_KEY, favorites);
  }

  addToFavorite(String favorite) {
    if (favorites == null) {
      favorites = [favorite];
    } else {
      var favoritesCopy = favorites;
      favoritesCopy.add(favorite);
      favorites = favoritesCopy;
    }
  }
}
