// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  final int? id;
  final String? nombre;
  final String? apellido;
  final String? apodo;
  final String? cuenta;
  final String? contra;
  final double? saldo;

  User({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.apodo,
    required this.cuenta,
    required this.contra,
    required this.saldo,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        apodo: json["apodo"],
        cuenta: json["cuenta"],
        contra: json["contra"],
        saldo: json["saldo"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "apodo": apodo,
        "cuenta": cuenta,
        "contra": contra,
        "saldo": saldo,
      };

  @override
  String toString() {
    return 'User(id: $id, nombre: $nombre, apellido: $apellido, apodo: $apodo, cuenta: $cuenta, contra: $contra, saldo: $saldo)';
  }
}
