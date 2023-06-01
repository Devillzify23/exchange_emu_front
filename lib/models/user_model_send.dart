import 'dart:convert';

class UserSend {
  final String nombre;
  final String apellido;
  final String cuenta;
  final String contra;
  final String apodo;

  UserSend({
    required this.nombre,
    required this.apellido,
    required this.cuenta,
    required this.contra,
    required this.apodo,
  });

  factory UserSend.fromJson(String str) => UserSend.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserSend.fromMap(Map<String, dynamic> json) => UserSend(
        nombre: json["nombre"],
        apellido: json["apellido"],
        cuenta: json["cuenta"],
        contra: json["contra"],
        apodo: json["apodo"],
      );

  Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "apellido": apellido,
        "cuenta": cuenta,
        "contra": contra,
        "apodo": apodo,
      };
}
