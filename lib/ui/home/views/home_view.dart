import 'package:amongus_generator/core/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

import 'package:amongus_generator/core/models/amongus_character.dart';
import 'package:amongus_generator/core/services/amongus_service.dart';
import 'package:amongus_generator/ui/widgets/character.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AmongUsService amongUsService = AmongUsService();
  AmongUsCharacter amongUsCharacter;

  @override
  void initState() {
    super.initState();
    getNewCharacter();
  }

  getNewCharacter() async {
    amongUsCharacter = await amongUsService.generateRandomCharacter();
    setState(() {});
  }

  saveCharacter() async {
    var prefs = await SharedPreferencesService.getInstance();
    prefs.addToFavorite(amongUsCharacterToJson(amongUsCharacter));

    amongUsCharacter = await amongUsService.generateRandomCharacter();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(height: 16),
        Text(
          'Desliza a izquierda o derecha',
          style: Theme.of(context).textTheme.headline5.copyWith(
                color: Colors.white,
              ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.highlight_off_rounded,
                size: 60,
                color: Colors.red,
              ),
              Icon(
                Icons.favorite_outline,
                size: 60,
                color: Colors.green,
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        Center(
          child: amongUsCharacter == null
              ? CircularProgressIndicator()
              : Dismissible(
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      getNewCharacter();
                    } else {
                      saveCharacter();
                    }
                  },
                  key: Key(amongUsCharacter.name),
                  child: Character(
                    amongUsCharacter: amongUsCharacter,
                  ),
                ),
        ),
        Spacer(),
      ],
    );
  }
}
