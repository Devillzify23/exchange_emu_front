import 'dart:io';

import 'package:exchange_emu_front/providers/menu_provider.dart';
import 'package:exchange_emu_front/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/currencies_provider.dart';
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
                          if (transactionProvider.transactions.isEmpty) {
                            menuProvider.cambiarOpt(4);
                            selectedWidget = menuProvider.widget;
                          } else {
                            menuProvider.cambiarOpt(3);
                            transactionProvider.getTransactions();
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
