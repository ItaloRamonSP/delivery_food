import 'package:flutter/material.dart';

class FinalVoucher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      contentPadding: EdgeInsets.only(top: 10.0),
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text(
                  "Pedido realizado com sucesso!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Divider(
              color: Colors.grey,
              height: 10,
            ),
            Image.asset('assets/confirma.gif'),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
              ),
              child: SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false),
                  child: Text(
                    "Fazer novo pedido",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
