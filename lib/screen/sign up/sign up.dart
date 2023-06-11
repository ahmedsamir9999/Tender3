


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender3/model/user_model.dart';
import 'package:tender3/screen/sign%20up/otp.dart';
import 'package:tender3/services/services.dart';

import '../../componant/defaultTextForm.dart';
import '../../const/style.dart';
import 'contoleller signUp/controller_signUp.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final control = Get.put(SignUpController());
  final ser = Services();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: K.primaryColor,
        title: Center(
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: control.formKey.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  'Full Name',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: DefaultTextForm(
                  obscure: false,
                  controller:control.fullName.value ,
                  // onChange: (value) {
                  //   control.fullName.value.text = value;
                  // },
                ),
              ),
              SizedBox(height: 9.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  'E-mail',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: DefaultTextForm(
                  obscure: false,
                  controller:control.email.value ,
                  // onChange: (value) {
                  //   control.email.value.text = value;
                  // },
                ),
              ),
              SizedBox(height: 9.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  'Phone number',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: DefaultTextForm(
                  obscure: false,
                  keyboardType: TextInputType.number,
                  controller:control.phoneNum.value ,
                  // onChange: (value) {
                  //   control.phoneNum.value.text = value;
                  // },
                ),
              ),
              SizedBox(height: 8.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: ()
                    {
                      control.isMale.value = true ;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20,left: 5),
                      child: Obx(() => Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: control.isMale.value ?K.primaryColor : K.primaryColor.withOpacity(.1.sp),
                          borderRadius:BorderRadius.circular(14),
                        ),
                      ),),
                    ),
                  ),
                  Text(
                    'Male',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(width: 146.w,),
                  GestureDetector(
                    onTap: ()
                    {
                      control.isMale.value =false ;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20,left: 5),
                      child: Obx(() => Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: !control.isMale.value ?K.primaryColor : K.primaryColor.withOpacity(.1.sp) ,
                          borderRadius:BorderRadius.circular(14),
                        ),
                      ),),
                    ),
                  ),
                  Text(
                    'Female',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  'Password',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: DefaultTextForm(
                  obscure: true,
                  controller:control.password.value ,
                  // onChange: (value) {
                  //   control.password.value.text = value;
                  // },
                ),
              ),
              SizedBox(height: 9.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: TextFormField(
                  obscureText: true,
                  controller: control.confirmPassword.value ,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ' Is Empty';
                    }
                    if(value != control.password.value.text )
                    {
                      return 'Not Match' ;
                    }
                  },
                  decoration: InputDecoration(
                      enabledBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                          borderSide: BorderSide(
                            color: K.primaryColor,
                            width: 3.w,
                          )
                      ),
                      filled: true,
                      fillColor: K.primaryColor.withOpacity(.06.sp),
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

                )
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: ()
                    {
                      control.acceptRules.value =true ;
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20,left: 5),
                      child: Obx(() => Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: control.acceptRules.value ? K.primaryColor : K.primaryColor.withOpacity(.1.sp),
                          borderRadius:BorderRadius.circular(14),
                        ),
                      ),),
                    ),
                  ),
                  Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h,),
              Center(
                child: TextButton(
                    onPressed: () async{
                      if (control.formKey.value.currentState!.validate())
                      {
                         control.isLoading.value =true ;

                        // await ser.addUserToFirebase(UserModel: UserModel(
                        //     name: control.fullName.value.text,
                        //     email: control.email.value.text,
                        //     phoneNum: control.phoneNum.value.text,
                        //     gender: control.isMale.value == true ? 'male' : 'female',
                        //     password: control.password.value.text,
                        // ));

                        // await ser.register(
                        //     emailSignUp: control.email.value.text,
                        //     passwordSignUp: control.password.value.text);
                       await control.sendVerificationCode(phone: control.phoneNum.value.text);

                        // Get.to(OtpScreen(
                        //   name: control.fullName.value.text,
                        //       email: control.email.value.text,
                        //       phone: control.phoneNum.value.text,
                        //       gender: control.isMale.value == true ? 'male' : 'female',
                        //       password: control.password.value.text,
                        // ));

                         control.isLoading.value =false ;
                       // Get.to(OtpScreen());
                      }
                    },
                    child: Container(
                        height: 45.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: K.primaryColor,
                          borderRadius: BorderRadius.circular(8.sp),
                        ),
                        child: Center(
                            child: Obx(() => Text(
                              // control.isLoading.value == false ? 'Sign Up' : 'Loading',
                              control.isLoading.value == false ? 'Sign Up'.tr : 'Waiting'.tr,
                              style:
                              TextStyle(color: Colors.white, fontSize: 12.sp),
                            ),),
                        ))),
              ),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  Text(
                    ' You have an account ?',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  TextButton(
                      onPressed: ()
                      {
                        Get.to(SignUpScreen());
                      },
                      child:  Text(
                        'Sign in',
                        style: TextStyle(
                            color: K.primaryColor,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                ],
              ),
            ],
          ),) ,

      ),
    );
  }
}
