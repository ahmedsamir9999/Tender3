

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tender3/module/module.dart';
import 'package:tender3/screen/login_screen/logIn_screen.dart';
import 'package:tender3/screen/map_screen/map.dart';
import 'package:tender3/screen/sign%20up/sign%20up.dart';
import 'package:tender3/screen/splash_screen/splash_screen.dart';
import 'package:tender3/test.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
          designSize: const Size(425 , 925),
          builder: (BuildContext , Widget)=> GetMaterialApp(
            debugShowCheckedModeBanner: false,
           home: SplashScreen(),
            //home: LogInScreen() ,
           // home: MapGps(),
           //  home: Module(date: 'test' ,
           //      time: 'test',
           //      pieces: 'test'),
           // home:SignUpScreen() ,
            //home: Test(),
          )),
    );
  }
}
