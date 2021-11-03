import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class LimpaCompra extends StatelessWidget {

  String title = '';
  IconData icon;
  Color statusColor;
  void Function() press;
  double? height;

  LimpaCompra( {Key? key,
    this.height,
    required this.press,
    required this.title,
    required this.icon,
    required this.statusColor,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(

      color: statusColor,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width * 0.36,
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: TextButton(
              onPressed: press,
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: statusColor,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Text(
                      title,
                      style: TextStyle(color: statusColor),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
