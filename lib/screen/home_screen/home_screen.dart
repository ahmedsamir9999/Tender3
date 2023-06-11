

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tender3/const/style.dart';
import 'package:tender3/screen/add_item_screen/add_item_screen.dart';
import 'controllers/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeScreenController>(
        init: HomeScreenController(),
        builder:(controller) => Column(
          children: [
            SizedBox(
              height: 5.w,
            ),
            Padding(
              padding: EdgeInsets.all(15.sp),
              child: Container(
                height: 300.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  border: Border.all(
                    width: 3.sp,
                    color: K.primaryColor,),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.sp),
                  child: CarouselSlider(
                    options:CarouselOptions(
                      onPageChanged: (index , reason)
                      {
                        controller.currentIndex.value = index ;
                      },
                      autoPlay: true ,
                      viewportFraction: 1,
                    ) ,
                    items: [
                      Image.asset(
                        'lib/assets/tender/2.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset('lib/assets/tender/1.jfif',
                        fit: BoxFit.fill,
                      ),
                      Image.asset('lib/assets/tender/3.jpeg',
                        fit: BoxFit.fill,
                      ),
                      Image.asset('lib/assets/tender/4.webp',
                        fit: BoxFit.fill,
                      ),],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h,),
            AnimatedSmoothIndicator(
              activeIndex: controller.currentIndex.value ,
              count: 4,
              effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    // width: 20,
                    // height: 5,
                      color: K.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      dotBorder: const DotBorder(
                        color: Colors.teal,
                      )),
                  activeDotDecoration: DotDecoration(
                    width: 23.w,
                    height: 8.h,
                    color: K.primaryColor,
                    borderRadius: BorderRadius.circular(12.sp),
                  )),
            ),
            SizedBox(height: 15.h,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: GestureDetector(
                onTap: ()
                {
                  Get.to(AddItemScreen());
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => AddItemScreen()));
                },
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: K.primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      'تبرع بالملابس',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
