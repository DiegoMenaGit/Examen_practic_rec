/* En esta clase estan definidos todos los valores 
del usuario, sacado a partir de un 
Json en Quicktipe, aqui se recogen los valores
 que se podrán asignar en el funcionamiento de la app*/
import 'package:meta/meta.dart';
import 'dart:convert';

class Usuaris {
  Usuaris({
    this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.phone,
    this.photo,
  });

  int? id;
  String name;
  String email;
  String address;
  String phone;
  String? photo;

  factory Usuaris.fromJson(String str) => Usuaris.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuaris.fromMap(Map<String, dynamic> json) => Usuaris(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phone: json["phone"],
        photo: json["photo"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "address": address,
        "phone": phone,
        "photo": photo,
      };
}
