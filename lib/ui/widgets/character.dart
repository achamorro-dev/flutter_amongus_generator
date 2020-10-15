import 'package:flutter/material.dart';

import 'package:amongus_generator/core/models/amongus_character.dart';

class Character extends StatelessWidget {
  final AmongUsCharacter amongUsCharacter;

  const Character({Key key, this.amongUsCharacter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(int.parse(amongUsCharacter.hexColor, radix: 16)),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Colors.black38,
            ),
            height: 60,
            width: 300,
            child: Center(
              child: Text(
                amongUsCharacter.name,
                style: Theme.of(context).textTheme.headline5.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 20,
          child: Container(
            height: 200,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(amongUsCharacter.image),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
