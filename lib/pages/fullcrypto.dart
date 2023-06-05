import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../preferences/shared_preferences.dart';
import '../providers/currencies_provider.dart';
import '../widgets/operation.dart';

class FullCryptoPage extends StatefulWidget {
  const FullCryptoPage({super.key});

  @override
  State<FullCryptoPage> createState() => _FullCryptoPageState();
}

class _FullCryptoPageState extends State<FullCryptoPage> {
  @override
  Widget build(BuildContext context) {
    final criptolist = Provider.of<CurrencyProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;
    TextStyle estilo =
        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          criptolist.fullcrypto.name,
          style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontStyle: FontStyle.italic),
        )),
      ),
      body: ListView(
        children: [
          Container(
            height: size.height * 0.1,
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/${criptolist.fullcrypto.symbol}.png"),
                  ),
                ),
                width: size.width * 0.3,
              ),
              Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.cyan,
                      spreadRadius: 5,
                      blurRadius: 8,
                    )
                  ],
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    criptolist.fullcrypto.symbol,
                    style: estilo,
                  ),
                ),
              )
            ]),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 5,
                ),
              ],
              color: Color.fromARGB(255, 241, 241, 241),
            ),
            height: size.height * 0.5,
            child: Center(
                child: Text(
              criptolist.fullcrypto.description,
              textAlign: TextAlign.center,
              style: estilo,
            )),
          ),
          Container(
            height: size.height * 0.08,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0),
                  spreadRadius: 5,
                ),
              ],
              color: Colors.cyan,
            ),
            child: Center(
              child: Text(
                "Estadisticas",
                style: estilo,
              ),
            ),
          ),
          Center(
              child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Max Supply: ${criptolist.fullcrypto.maxSupply}",
                    style: estilo,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Actual Price: ${criptolist.fullcrypto.pricing.currentPrice} €",
                    style: estilo,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Volume 24H: ${criptolist.fullcrypto.pricing.volume24H}",
                    style: estilo,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Max Supply: ${criptolist.fullcrypto.pricing.priceChange} %",
                    style: estilo,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: Colors.cyan,
                ),
                child: Center(
                  child: Text(
                    "Operaciones",
                    style: estilo,
                  ),
                ),
              ),
              Container(
                height: size.height * 0.1,
                child: Row(children: [
                  Container(
                    width: size.width * 0.5,
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Preferences.optype = "C";
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Operation();
                            });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.5)),
                            color: Color.fromRGBO(142, 255, 107, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            "Comprar",
                            style: estilo,
                          ),
                        ),
                      ),
                    )),
                  ),
                  Container(
                    width: size.width * 0.5,
                    child: Center(
                        child: InkWell(
                      onTap: () {
                        Preferences.optype = "V";
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Operation();
                            });
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.5)),
                            color: Color.fromRGBO(255, 127, 101, 1),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(3, 1),
                              )
                            ]),
                        child: Center(
                          child: Text(
                            "Vender",
                            style: estilo,
                          ),
                        ),
                      ),
                    )),
                  )
                ]),
              )
            ],
          ))
        ],
      ),
    );
  }
}
