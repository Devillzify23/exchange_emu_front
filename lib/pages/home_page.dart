import 'package:exchange_emu_front/widgets/simple_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget? selectedWidget;
    final size = MediaQuery.of(context).size;
    String titulo = "ff";
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          titulo,
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        )),
        actions: [
          IconButton(
              iconSize: 50,
              onPressed: () {
                print('Hola');
              },
              icon: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
                backgroundColor: Colors.white,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.8,
            color: Color.fromARGB(255, 0, 0, 0),
            child: SimpleCurrencyList(),
          ),
          Container(
            width: size.width,
            height: size.height * 0.1,
            color: Colors.cyan,
            child: Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  color: Colors.red,
                ),
                Container(
                  width: size.width * 0.4,
                  color: Colors.black,
                ),
                Container(
                  width: size.width * 0.3,
                  color: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  opcionHistorial() {
    print("hola");
  }
}
