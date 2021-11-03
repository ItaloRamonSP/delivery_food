import 'package:flutter/material.dart';

import 'button_widget.dart';

class TelasCard extends StatelessWidget {
  String image;
  String title;
  String price;
  int quantity;
  dynamic Function() onSub;
  dynamic Function() onAdd;

  TelasCard({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
    required this.quantity,
    required this.onAdd,
    required this.onSub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(children: [
              ClipRRect(
                child: SizedBox(
                  width: 100,
                  height: 110,
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                  ),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              Row(children: [
                Column(children: [
                  Container(
                    width: 250,
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 30),
                    child: Row(children: [
                      Button(
                        func: onSub,
                        text: "-",
                      ),
                      Text(
                        '$quantity',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Button(
                        func: onAdd,
                        text: "+",
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.40,
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'R\$' '$price',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                  ),
                ]),
              ]),
            ]),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                margin: EdgeInsets.only(bottom: 5,top: 5),
                decoration: BoxDecoration(color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
