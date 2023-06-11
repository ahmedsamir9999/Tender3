
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tender3/screen/login_screen/logIn_screen.dart';
import 'package:tender3/services/services.dart';
import '../../const/style.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

final ser = Services();

  @override
  void initState() {
   Timer(
        Duration(seconds: 5),
            ()async{
         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));

              if(await ser.auth.currentUser != null)
              {
                Get.offAll(Home());
              }else
              {
                Get.offAll(LogInScreen());
              }
        }
    );



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.primaryColor,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 300.h ,
                width: 300.w,
                child: Image.asset('lib/assets/images/logo.png')
            ),
            K.sizeBoxH,
            SizedBox(
              width:MediaQuery.of(context).size.width-100.w ,
              child: RotatedBox(
                quarterTurns:2,
                child: LinearProgressIndicator(
                  minHeight: 2,
                  color: Colors.white,
                  backgroundColor: K.mainColor.withOpacity(.5),
                ),
              ),
            ),
          ],
        ),
      ) ,
    );
  }
}
