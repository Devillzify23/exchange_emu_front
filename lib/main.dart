import 'package:exchange_emu_front/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "wallets", page: () => const Wallets()),
        GetPage(name: "history", page: () => const History()),
        GetPage(name: "user", page: () => const UserDetails())
      ],
    ));
