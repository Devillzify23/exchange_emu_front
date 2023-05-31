import 'package:exchange_emu_front/models/models.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  @override
  void onInit() {
    // TODO: implement onInit
    print("Usuarios provider init");
  }

  Future<User> getUser(String cuenta, String contra) async {
    final response =
        await get('http://192.168.1.76:8080/users/login/devillzify/1234');
    return null;
  }
}
