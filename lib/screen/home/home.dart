import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender3/screen/home/controllers/home_controller.dart';
import '../../const/style.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
        builder: (controller)=> Scaffold(
          appBar: AppBar(
            backgroundColor: K.primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarColor: K.primaryColor,
            ),
            title: Center(
              child: Text(
                controller.titles[controller.currentIndex.value],
                style: const TextStyle(
                    color: Colors.white ),
              ),
            ),
            toolbarHeight:100.h ,
          ),
          body: controller.screens[controller.currentIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 30.sp,
            selectedItemColor: K.primaryColor,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex:controller.currentIndex.value ,
            onTap: (i)
            {
              controller.changTapIndex(i);

            },
            items:  const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: 'تواصل معنا'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: 'الرئيسيه'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.spatial_tracking),
                  label: 'تتبع الطاب'
              ),
            ],
          ),

        )
    );
  }
}
