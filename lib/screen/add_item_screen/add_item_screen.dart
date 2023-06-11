import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tender3/model/item_model.dart';
import 'package:tender3/screen/add_item_screen/controllers/add_item_controller.dart';
import 'package:tender3/screen/home/home.dart';
import 'package:tender3/screen/map_screen/map_screen.dart';
import 'package:tender3/services/services.dart';

import '../../componant/snack_Bar.dart';
import '../../const/style.dart';

class AddItemScreen extends StatelessWidget {

  String? numHouse ;
  String? numAddress ;
  String? specialMark ;

   AddItemScreen({
     super.key,
     this.numHouse,
     this.numAddress,
     this.specialMark,
   });

   final controller = Get.put(AddItemController());
   final ser = Services() ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                GetBuilder<AddItemController>(
                  init:AddItemController() ,
                  builder: (controller) => GestureDetector(
                    onTap: ()
                    {
                      controller.pickImage() ;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20.sp),
                      child: Container(
                          height: 400.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 2.sp, color: K.primaryColor),
                          ),
                          child:controller.image == null ?
                          Image.asset(
                            'lib/assets/images/addimage.png',
                          ) :
                          Image.file(controller.image!,fit: BoxFit.fill,)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Must be Not Empty';
                      }
                    },
                    onChanged: (value)
                    {
                      controller.numPieces.text =value ;
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      hintText: 'عدد القطع',
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
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Must be Not Empty';
                      }
                    },
                    onChanged: (value)
                    {
                      controller.address.text =value ;
                    },
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: ()
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                          },
                          focusColor: Colors.grey,
                          icon: const Icon(Icons.add_location_outlined)),
                      hintText: '...العنوان',
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
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be Not Empty';
                            }
                          },
                          textAlign: TextAlign.center,
                          controller: controller.dateController,
                          keyboardType: TextInputType.none,
                          onTap: ()
                          {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2023-12-01'),
                            ).then((value)
                            {
                              controller.dateController.text = DateFormat.yMMMd().format(value!) ;
                            } );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.calendar_month,color: Colors.grey,),
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
                      SizedBox(width: 40.w,),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Must be Not Empty';
                            }
                          },
                          textAlign: TextAlign.center,
                          controller: controller.timeController,
                          keyboardType: TextInputType.none,
                          onTap: ()
                          {
                            showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now()
                            ).then((value)
                            {
                              controller.timeController.text = value!.format(context).toString();
                            } );
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.timer_outlined,color: Colors.grey,),
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
                SizedBox(
                  height: 20.h,
                ),
                TextButton(
                    onPressed: ()async
                    {
                     if(controller.formKey.currentState!.validate() )
                     {
                       controller.isLoading.value =true ;
                      await ser.addItemToFirebase(
                           ItemModel: ItemModel(
                               address: controller.address.text,
                               apartmentNumber: numHouse,
                               areaNumber: numAddress,
                               date: controller.dateController.text,
                               imageUrl:await ser.uploadImageToFirebaseStorage(
                                   imagePath: controller.image!.path,
                                   imageName:controller.image!.path ),
                               landMark: specialMark,
                               lat: 'test',
                               lng: 'test',
                               pieces: controller.numPieces.text,
                               states: 'test',
                               time: controller.timeController.text,
                               userToken: ser.auth.currentUser!.uid
                           ));
                       Get.off(Home());
                       controller.isLoading.value =false ;
                     }//else {showSnackBar(context , 'Enter all data' );}
                    },
                    child: Container(
                      height: 50.h,
                      width: 110.w,
                        decoration: BoxDecoration(
                          color: K.primaryColor,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Center(
                            child: GetX<AddItemController>(
                              builder: (controller)=>  Text(controller.isLoading.value == true ? 'Loading...' :'submit',
                                style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                            )
                      ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
