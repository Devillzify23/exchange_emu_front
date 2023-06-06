import 'package:exchange_emu_front/providers/menu_provider.dart';
import 'package:exchange_emu_front/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../preferences/shared_preferences.dart';

import '../providers/user_provider.dart';
import '../providers/wallets_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context, listen: false);
    final transactionProvider =
        Provider.of<TransactionProvider>(context, listen: false);
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    TextStyle estilo =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    Widget? selectedWidget = menuProvider.widget;
    final size = MediaQuery.of(context).size;
    String titulo = menuProvider.nombreMenu;
    return Scaffold(
      backgroundColor: Colors.black,
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: Colors.black,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: size.height * 0.5,
                          width: size.width * 0.5,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              height: size.height * 0.1,
                              child: Center(
                                child: Text(
                                  "Datos de usuario",
                                  style: estilo,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              height: size.height * 0.1,
                              child: Center(
                                child: Text(
                                  Preferences.apodo,
                                  style: estilo,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                              ),
                              height: size.height * 0.1,
                              child: Center(
                                child: Text(
                                  "Saldo: ${(Preferences.saldo).toStringAsFixed(2)} €",
                                  style: estilo,
                                ),
                              ),
                            ),
                            SizedBox(height: size.height * 0.05),
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Colors.red,
                                  border: Border.all(color: Colors.black),
                                ),
                                height: size.height * 0.1,
                                width: size.width * 0.5,
                                child: Center(
                                  child: Text(
                                    "Log Out",
                                    style: estilo,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Preferences.logged = false;
                                Navigator.pushNamed(context, '/');
                              },
                            )
                          ]),
                        ),
                      );
                    });
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
      body: ListView(children: [
        Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.80,
              color: const Color.fromARGB(255, 0, 0, 0),
              child: selectedWidget,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width,
              height: size.height * 0.05,
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                InkWell(
                    child: Container(
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/clock.png")),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.5)),
                            color: Colors.grey,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              )
                            ])),
                    onTap: () => setState(() {
                          transactionProvider.getTransactions();
                          {
                            menuProvider.cambiarOpt(3);
                            selectedWidget = menuProvider.widget;
                          }
                        })),
                SizedBox(
                  width: size.width * 0.1,
                ),
                InkWell(
                    child: Container(
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/home.png")),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.5)),
                            color: Colors.grey,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              )
                            ])),
                    onTap: () => setState(() {
                          menuProvider.cambiarOpt(1);
                          selectedWidget = menuProvider.widget;
                        })),
                SizedBox(
                  width: size.width * 0.1,
                ),
                InkWell(
                    child: Container(
                        width: size.width * 0.20,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/images/wallet.png"),
                            ),
                            border: Border.all(color: Colors.black),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.5)),
                            color: Colors.grey,
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(0, 0),
                              )
                            ])),
                    onTap: () => setState(() {
                          menuProvider.cambiarOpt(2);
                          walletProvider.getWallets();
                          selectedWidget = menuProvider.widget;
                        }))
              ]),
            ),
          ],
        ),
      ]),
    );
  }
}
