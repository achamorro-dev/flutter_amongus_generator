import 'package:flutter/material.dart';

import 'package:amongus_generator/ui/widgets/character.dart';
import 'package:amongus_generator/core/models/amongus_character.dart';
import 'package:amongus_generator/core/services/shared_preferences_service.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: getFavorites(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data == null || snapshot.data.length == 0) {
              return Text(
                'No hay favoritos guardados aún',
                style: TextStyle(color: Colors.white),
              );
            }

            return ListView.separated(
              separatorBuilder: (_,__) => SizedBox(height: 20,),
              itemCount: snapshot.data.length,
              itemBuilder: (_, index) =>  snapshot.data[index],
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }

  Future<List<Widget>> getFavorites() async {
    var prefs = await SharedPreferencesService.getInstance();
    if (prefs.favorites == null) return [];

    return prefs.favorites
        .map((characterJson) => new Character(
              amongUsCharacter: amongUsCharacterFromJson(characterJson),
            ))
        .toList();
  }
}
