import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islam/Utils/text_view.dart';
import 'app_colors.dart';

class BTN extends StatelessWidget {

  final onPressed;
  final IconData icon;
  final String text;

   BTN({
    Key? key,
    required this.onPressed, required this.icon, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: size.height * 0.07,
          width: size.width * 0.15,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 35,
            color: Colors.red,
          ),
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
