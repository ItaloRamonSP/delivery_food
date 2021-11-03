import 'package:flutter/material.dart';
import 'package:telas/components/finaliza_widget.dart';
import 'package:telas/components/telascard_widget.dart';
import 'package:telas/services/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double priceTotal = 0.0;

  List comidas = [
    {
      'id': 1,
      'image': 'assets/burguer.jpg',
      'price': 12,
      'title': 'Big Burguer Cheddar',
      'quantidade': 0,
    },
    {
      'id': 2,
      'image': 'assets/coquinha.jpg',
      'price': 8,
      'title': 'Coca Cola',
      'quantidade': 0,
    },
    {
      'id': 3,
      'image': 'assets/acai.jpg',
      'price': 13,
      'title': 'Açai C/ Banana',
      'quantidade': 0,
    },
    {
      'id': 4,
      'image': 'assets/pizza.jpg',
      'price': 37,
      'title': 'Pizza Calabresa',
      'quantidade': 0,
    },
    {
      'id': 5,
      'image': 'assets/batata.jpg',
      'price': 4,
      'title': 'Batata Frita',
      'quantidade': 0,
    },
  ];

  calculate(var comida, bool adiciona) {
    if (adiciona) {
      if (priceTotal == 0) priceTotal += 6;
      priceTotal += comida['price'];
    } else {
      priceTotal -= comida['price'];
      if (priceTotal == 6) priceTotal = 0;
    }

    setState(() {
      priceTotal.toStringAsFixed(2);
    });
  }

  quantSub(var comida) {
    if (comida['quantidade'] > 0) {
      setState(() {
        comida['quantidade']--;
        calculate(comida, false);
      });
    }
  }

  quantAdd(var comida) {
    setState(() {
      comida['quantidade']++;
      calculate(comida, true);
    });
  }

  @override
  initState() {
    SharedPreferencesRepository.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Cardápio',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () => {}),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: <Widget>[
                            for (var comida in comidas)
                              TelasCard(
                                image: comida['image'],
                                price: comida['price'].toStringAsFixed(2),
                                quantity: comida['quantidade'],
                                onSub: () => quantSub(comida),
                                onAdd: () => quantAdd(comida),
                                title: comida['title'],
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                FinalPrice(
                    taxa: "Taxa de Entrega",
                    valor: 6.toStringAsFixed(2),
                    price: priceTotal,
                    func: () {
                      SharedPreferencesRepository.putDouble('priceFinal', priceTotal);
                      Navigator.pushNamed(context, '/confirm');
                    }, buttontitle: 'Fazer Pedido',)
              ],
            ),
          ),
        ));
  }
}
