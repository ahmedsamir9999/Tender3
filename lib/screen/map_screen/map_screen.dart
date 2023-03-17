import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender3/screen/add_item_screen/add_item_screen.dart';
import 'package:tender3/screen/map_screen/controllers/map_controller.dart';
import '../../const/style.dart';

class MapScreen extends StatelessWidget {
   MapScreen({Key? key}) : super(key: key);

  final controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                    height: 500.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2.sp, color: K.primaryColor),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be Not Empty';
                            }
                          },
                          textAlign: TextAlign.end,
                          onChanged: (value)
                          {
                            controller.numHouse.text =value ;
                          },
                          decoration: InputDecoration(
                            hintText: 'رقم الشقه',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide:
                              BorderSide(color: K.primaryColor,
                                width: 2.sp,),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide:
                              BorderSide(color: K.primaryColor, width: 2.sp,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be Not Empty';
                            }
                          },
                          textAlign: TextAlign.end,
                          onChanged: (value)
                          {
                            controller.numAddress.text =value ;
                          },
                          decoration: InputDecoration(
                            hintText: 'رقم المنطقه',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide:
                              BorderSide(color: K.primaryColor,
                                width: 2.sp,),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.sp),
                              borderSide:
                              BorderSide(color: K.primaryColor, width: 2.sp,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Must be Not Empty';
                      }
                    },
                    onChanged: (value)
                    {
                      controller.specialMark.text =value ;
                    },
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'علامه مميزه',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide:
                        BorderSide(color: K.primaryColor, width: 2.sp,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide:
                        BorderSide(color: K.primaryColor, width: 2.sp,),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 120.h,),
                TextButton(
                    onPressed: ()
                    {
                      if (controller.formKey.currentState!.validate())
                      {
                        Get.to(
                            AddItemScreen(
                              numAddress: controller.numAddress.text ,
                              numHouse: controller.numHouse.text ,
                              specialMark: controller.specialMark.text ,
                            ));
                      }
                    },
                    child: Container(
                        height: 45.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: K.primaryColor,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Center(child: Text('تأكيد العنوان',style: TextStyle(color: Colors.white,fontSize: 12.sp),)))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
