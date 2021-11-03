import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ControllerVoucher extends StatelessWidget {

  void Function()? func;
  String title;
  IconData icon;
  Color statusColor;

  ControllerVoucher({Key? key,
    required this.statusColor,
    required this.func,
    required this.title,
    required this.icon,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(12),
        color: statusColor,
        child: Container(
            alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 20,
                    color: statusColor,
                  ),
                  TextButton(
                    onPressed: func,
                    child: Text(title,
                        style: TextStyle(color: statusColor)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
