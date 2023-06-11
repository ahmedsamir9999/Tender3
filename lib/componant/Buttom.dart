
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/style.dart';

class Button extends StatelessWidget {
  double height;
  double width;
  String text;
  bool isFramed;//flag
  void Function()? onPressed;
  Button({
    Key? key,
    required this.width,
    required this.height,
    required this.isFramed,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(isFramed?Colors.white:K.primaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side:BorderSide(color: isFramed?Colors.grey:Colors.transparent,width: 2),
                )
            )

        ),
        onPressed: onPressed, child: Text(text,style: TextStyle(fontSize: 18,color: isFramed?Colors.grey:Colors.white),),

      ),
    );
  }
}