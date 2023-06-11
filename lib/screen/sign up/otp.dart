

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tender3/services/services.dart';

import '../../componant/Buttom.dart';
import '../../componant/PinCodeField.dart';
import '../../model/user_model.dart';
import 'contoleller signUp/controller_signUp.dart';

class OtpScreen extends StatelessWidget {

  late final String? verificationId;
  String? name;
  String? phone;
  String? gender ;
  String? email ;
  String? password ;

  OtpScreen({Key? key,
     this.verificationId,
     this.name,
     this.phone,
     this.gender,
     this.password,
     this.email,

  })  : super(key: key);

  final control = Get.put(SignUpController());
  final ser = Services();

  TextEditingController pinNumber = TextEditingController();
  final controller = Services();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: Obx(() => Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Image.asset(
                  "lib/assets/images/check-mark.png",
                  width: 180.w,
                  height: 180.h,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: PinCodeField(
                    textEditingController:pinNumber,
                  ),
                ),
                Button(
                  width: 200,
                  isFramed: false,
                  height: Get.height / 20.h,
                  onPressed: () async {
                    control.isLoading.value =true ;

                    await  controller.verifyCode(
                      verificationId: verificationId!,
                      smsCode:pinNumber.text,
                    );

                    await ser.register(
                        emailSignUp: control.email.value.text,
                        passwordSignUp: control.password.value.text);

                    await ser.addUserToFirebase(UserModel: UserModel(
                      name: control.fullName.value.text,
                      email: control.email.value.text,
                      phoneNum: control.phoneNum.value.text,
                      gender: control.isMale.value == true ? 'male' : 'female',
                      password: control.password.value.text,
                    ));

                    control.isLoading.value =false ;

                  },
                  text: control.isLoading.value == false ? 'Confirm'.tr : 'Loading'.tr,
                ),
                SizedBox(height: 20.h,),
                Button(
                  isFramed: true,
                  height: Get.height / 20.h,
                  text: "Resend ".tr,
                  onPressed: () async {

                  }, width: 200,),
              ],
            ),),
          ),
        ),
      ),
    );
  }
}