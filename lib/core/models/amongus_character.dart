import 'dart:convert';

AmongUsCharacter amongUsCharacterFromJson(String str) =>
    AmongUsCharacter.fromJson(json.decode(str));

String amongUsCharacterToJson(AmongUsCharacter data) =>
    json.encode(data.toJson());

class AmongUsCharacter {
  AmongUsCharacter({
    this.name,
    this.image,
    this.color,
    this.hexColor,
    this.hasHat,
  });

  String name;
  String image;
  String color;
  String hexColor;
  bool hasHat;

  factory AmongUsCharacter.fromJson(Map<String, dynamic> json) =>
      AmongUsCharacter(
        name: json["name"],
        image: json["image"],
        color: json["color"],
        hexColor: json["hexColor"],
        hasHat: json["hasHat"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "color": color,
        "hexColor": hexColor,
        "hasHat": hasHat,
      };
}
