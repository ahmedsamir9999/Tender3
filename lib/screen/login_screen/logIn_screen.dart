import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:tender3/helpers/shared.dart';
import 'package:tender3/screen/home/home.dart';
import 'package:tender3/screen/login_screen/login_controller/logIn_controller.dart';
import 'package:tender3/screen/sign%20up/sign%20up.dart';
import 'package:tender3/services/services.dart';

import '../../const/style.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);
  final controller = Get.put(LogInController());
  final ser = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Image.asset('lib/assets/images/login.png'),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      controller.email.text = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email is Empty';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email,color: Colors.grey),
                      labelStyle: const TextStyle(color: K.primaryColor),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide: BorderSide(
                          color: K.primaryColor,
                          width: 2.sp,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                        borderSide: BorderSide(
                          color: K.primaryColor,
                          width: 2.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: GetBuilder<LogInController>(
                    init: LogInController(),
                    builder: (controller) => TextFormField(
                      obscureText: controller.show,
                      cursorColor: Colors.grey,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        controller.password.text = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is Empty';
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock,color: Colors.grey),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.changeIcon();
                            },
                            icon: controller.show
                                ? const Icon(
                                    Icons.visibility,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )),
                        labelStyle: const TextStyle(color: K.primaryColor),
                        labelText: 'password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                          borderSide: BorderSide(
                            color: K.primaryColor,
                            width: 2.sp,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.sp)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.sp),
                          borderSide: BorderSide(
                            color: K.primaryColor,
                            width: 2.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w,),
                    Padding(
                      padding: EdgeInsets.all(15.sp),
                      child: TextButton(
                          onPressed: () async {
                            if (controller.formKey.currentState!.validate()) {
                              MyCache.PutString(key: MyChachKey.email, value:controller.email.text );
                              MyCache.PutString(key: MyChachKey.password, value:controller.password.text );
                              try {
                             await ser.signIn(
                                emailSignIn: controller.email.text ,
                                passwordSignIn: controller.password.text ,
                              );

                             Get.offAll(Home());
                            }on FirebaseAuthException catch(e){
                                Get.defaultDialog(
                                  title: 'failed',
                                  content: Text(e.code),
                                );
                           }
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
                                  child: Text(
                                'LogIn',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12.sp),
                              )))),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'create new account:'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(SignUpScreen());
                        },
                        child: Text(
                          'Register',
                          style:
                              TextStyle(color: K.primaryColor, fontSize: 12.sp),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
