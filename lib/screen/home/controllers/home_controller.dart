
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender3/screen/add_info_screen/info.dart';

import '../../history_screen/history.dart';
import '../../home_screen/home_screen.dart';

class HomeController extends GetxController
{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  final currentIndex =1.obs;
  List<Widget> screens =[
    InfoScreen(),
    HomeScreen(),
    HistoryScreen(),
  ];
  List<String> titles = [
    'تواصل معنا',
    'الرئيسيه',
    'تتبع الطاب',
  ];

  changTapIndex(index)
  {
    currentIndex.value = index ;
  }
}