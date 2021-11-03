import 'package:flutter/material.dart';

class FinalPrice extends StatelessWidget {
  void Function()? func;
  double price;
  String taxa;
  String valor;
  String buttontitle;
  Color? statusColor = Colors.black;

  FinalPrice(
      {Key? key,
      this.statusColor,
      required this.buttontitle,
      required this.price,
      required this.func,
      required this.taxa,
      required this.valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 10),
              width: MediaQuery.of(context).size.width * 0.40,
              alignment: Alignment.centerLeft,
              child: Text(
                taxa,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.48,
              alignment: Alignment.centerRight,
              child: Text(
                "R\$" + valor,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: statusColor),
              ),
            ),
          ],
        ),
        Row(
          // Linha de traços
          children: List.generate(
              1200 ~/ 10,
              (index) => Expanded(
                    child: Container(
                      color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                      height: 3,
                    ),
                  )),
        ),
        Row(
          children: [
            Container(
              height: 40,
              margin: EdgeInsets.only(top: 5),
              width: MediaQuery.of(context).size.width * 0.40,
              alignment: Alignment.centerLeft,
              child: Text(
                "Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.48,
              alignment: Alignment.centerRight,
              child: Text(
                "R\$" + price.toStringAsFixed(2),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(bottom: 10, top: 20),
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(15)),
            child: TextButton(
                child: Text(
                  buttontitle,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onPressed: func)),

      ],
    );
  }
}
