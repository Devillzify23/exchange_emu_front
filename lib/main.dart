import 'package:exchange_emu_front/pages/fullcrypto.dart';
import 'package:exchange_emu_front/pages/home_page.dart';
import 'package:exchange_emu_front/pages/pages.dart';
import 'package:exchange_emu_front/providers/currencies_provider.dart';
import 'package:exchange_emu_front/providers/menu_provider.dart';
import 'package:exchange_emu_front/providers/transaction_provider.dart';
import 'package:exchange_emu_front/providers/user_provider.dart';
import 'package:exchange_emu_front/providers/wallets_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => CurrencyProvider()),
      ChangeNotifierProvider(create: (_) => MenuProvider()),
      ChangeNotifierProvider(create: (_) => WalletProvider()),
      ChangeNotifierProvider(create: (_) => TransactionProvider())
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
        '/user': (context) => const UserDetails(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/crypto': (context) => FullCryptoPage(),
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
