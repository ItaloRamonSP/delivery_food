import 'package:flutter/material.dart';

class Voucher extends StatelessWidget {
  String codInserido = '';
  String title;

  Voucher({
    required this.title,
});

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
              children: <Widget>[
                Text(
                  title,
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
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextField(
                  onChanged: (text) => codInserido = text,
                  decoration: InputDecoration(

                    border: InputBorder.none,
                  ),
                  maxLines: 8,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
              ),
              child: SizedBox(
                height: 60,
                child: TextButton(
                  onPressed: () => Navigator.pop(context, codInserido),
                  child: Text(
                    "Confirmar",
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
