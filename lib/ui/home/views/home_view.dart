import 'package:amongus_generator/core/models/amongus_character.dart';
import 'package:amongus_generator/core/services/amongus_service.dart';
import 'package:amongus_generator/ui/widgets/character.dart';
import 'package:flutter/material.dart';

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
    amongUsCharacter = await amongUsService.generateRandomCharacter();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
