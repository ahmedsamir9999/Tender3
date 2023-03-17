
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/style.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    Timer(
        Duration(seconds: 5),
            (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
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
