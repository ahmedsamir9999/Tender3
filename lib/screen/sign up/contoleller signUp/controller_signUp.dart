
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../services/services.dart';
import '../otp.dart';

class SignUpController extends GetxController
{
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;
  final confirmPassword = TextEditingController().obs;
  final phoneNum = TextEditingController().obs;
  final fullName = TextEditingController().obs ;
  RxBool isLoading = false.obs ;



  RxBool isMale = true.obs ;
  RxBool acceptRules = false.obs ;
  var formKey = GlobalKey<FormState>().obs;


  sendVerificationCode({required String phone}) async{
    await Services().auth.verifyPhoneNumber(
        phoneNumber: '+2$phone' ?? '',
        timeout: const Duration(seconds: 10),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
        {
          await Services().auth.signInWithCredential(phoneAuthCredential).then((value) => {
            if(value.user == null){
              // print('verification failed')
              Get.defaultDialog(title: 'Error' , content: const Text('failed'))
            }
          });
        } ,
        verificationFailed: (FirebaseAuthException error)
        {
          Get.defaultDialog(content: Text(error.code),title: 'failed');
        },
        codeSent: (String verificationId,int ?resendToken ){
          Get.to(OtpScreen(
            verificationId:verificationId,
            // name: fullName.value.text,
            //       email: email.value.text,
            //       phone: phoneNum.value.text,
            //       gender: isMale.value == true ? 'male' : 'female',
            //       password: password.value.text,
          ));
        },
        codeAutoRetrievalTimeout:(String){});
  }

}