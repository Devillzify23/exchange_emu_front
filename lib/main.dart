import 'package:exchange_emu_front/pages/home_page.dart';
import 'package:exchange_emu_front/pages/pages.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:exchange_emu_front/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CurrencyProvider())
    ], child: const Myapp()),
  );
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    String page = '';

    if (Preferences.logged == true) {
      page = '/home';
    } else {
      page = '/';
    }

    return MaterialApp(
      initialRoute: page,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const Login(),
        '/wallets': (context) => const Wallets(),
        '/history': (context) => const History(),
        '/user': (context) => const UserDetails(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage()
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme.lerp(
              const AppBarTheme(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0)),
              const AppBarTheme(color: Color.fromARGB(255, 118, 255, 228)),
              2)),
    );
  }
}
