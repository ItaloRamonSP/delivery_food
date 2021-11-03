import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  var text = '';
  Function() func;

Button({Key? key,
  required this.text,
  required this.func,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        width: 30,
        child: TextButton(
          style: ButtonStyle(
          ),
          child: Text(
            text,
            style: TextStyle(
            fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            onPressed:func,
        ),
    );
  }
}
