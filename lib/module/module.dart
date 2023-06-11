import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/style.dart';


class ItemShape extends StatelessWidget {
   ItemShape({super.key,
     required this.date,
     required this.time,
     required this.pieces,
     required this.imageUrl,
});

  String? date ;
  String? time ;
  String? pieces ;
  String states ='Accept';
  String imageUrl ;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Container(
          width: double.infinity,
          height: 300.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.sp),
            border: Border.all(
              color: Colors.grey,
              width: 2.sp,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.sp,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.sp,
                            )),
                        child: Row(
                          children: [
                            Text('$date  $time',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold)),
                            Text(' : التاريخ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        children: [
                          Text('$pieces',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(' : عدد القطع',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Row(
                        children: [
                          Text('$states',
                              style: TextStyle(
                                  color: K.primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(' : الحاله',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.sp,
                    ),
                    child: Container(
                      height: 200.h,
                      width: 150.w,
                      child: Image.network(imageUrl),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.sp,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30.w,
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: K.primaryColor,
                              borderRadius: BorderRadius.circular(8.sp),
                            ),
                            child: Center(
                                child: Text(
                                  'التفاصيل',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.sp,fontWeight: FontWeight.bold),
                                )))),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.sp),
                                border: Border.all(color: Colors.grey,width: 2.sp,)
                            ),
                            child: Center(
                                child: Text(
                                  'الغاء',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.sp,fontWeight: FontWeight.bold),
                                )))),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ItemDetails extends StatelessWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}



