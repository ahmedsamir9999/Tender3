import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/style.dart';

class RowMoreInfoScreen extends StatelessWidget {
  String text;
  Widget widget;

  RowMoreInfoScreen({Key? key,required this.text, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: OutlineInputBorder(
        borderRadius:BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      elevation: 3,
      child: Padding(
        padding:   EdgeInsets.all(8.0.sp),
        child: Row(
          children: [
            widget,
            // Icon(icon,color: K.primaryColor/**/,),
            K.sizedBoxW,
            Text(text),
          ],
        ),
      ),
    );
  }
}
