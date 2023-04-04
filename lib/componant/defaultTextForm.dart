import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tender3/const/style.dart';

class DefaultTextForm extends StatelessWidget {

   Function(String)? onChange;
   TextEditingController? controller ;
   bool? obscure = false ;
   TextInputType? keyboardType ;

   DefaultTextForm({super.key, this.onChange , this.controller ,  this.obscure , this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: keyboardType ,
      obscureText: obscure! ,
      controller: controller ,
      validator: (value) {
        if (value!.isEmpty) {
          return ' Is Empty';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              borderSide: BorderSide(
                color: K.primaryColor,
                width: 3.w,
              ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          borderSide: BorderSide(
            color: K.primaryColor,
            width: 3.w,
          )
        ),
      ),
    );
  }
}