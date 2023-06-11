import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:tender3/model/item_model.dart';
import 'package:tender3/model/user_model.dart';
import 'package:tender3/screen/sign%20up/otp.dart';

import '../screen/home/home.dart';

class Services {
  final auth = FirebaseAuth.instance;
  final cloudStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance ;

  signIn({required emailSignIn, required passwordSignIn}) async {
    await auth.signInWithEmailAndPassword(
        email: emailSignIn, password: passwordSignIn);
  }

  register({required emailSignUp, required passwordSignUp}) async {
    try{
      await auth.createUserWithEmailAndPassword(
          email: emailSignUp, password: passwordSignUp);
    }on FirebaseAuthException catch(e)
    {
      Get.defaultDialog(
        title: 'failed',
        content: Text(e.code),
      );
    }
  }



  sendVerificationCode({required String phone}) async{
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phone' ?? '',
        timeout: const Duration(seconds: 10),
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async
        {
          await auth.signInWithCredential(phoneAuthCredential).then((value) => {
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
        codeSent: (String verificationId , int? resendToken )
        {
          OtpScreen().verificationId = verificationId ;
        },
        codeAutoRetrievalTimeout:(String){});
  }

  // sendVerificationCode({phone })async{
  //   await auth.verifyPhoneNumber(
  //     phoneNumber: '${phone}',//??''
  //     verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
  //       ///
  //       await auth.signInWithCredential(phoneAuthCredential).then((value){
  //         if(value.user !=null){
  //           print('user verified');
  //         }
  //         else{
  //           print('%%%%%%%%%%%%%%%% failed');
  //         }
  //       });
  //
  //     },
  //     verificationFailed: (FirebaseAuthException e){
  //
  //       Get.defaultDialog(content: Text('${e.code}'),title: 'nointernet');
  //     },
  //     codeSent: (String verificationId,int ?resendToken ){
  //      // Get.to(OTPScreen(verificationId:verificationId,  name: '', phone: '',));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId){
  //
  //     },
  //     timeout: Duration(minutes: 1),
  //   );
  // }

  verifyCode({
    required String verificationId,
    required smsCode,
    ItemModel? ItemModel
  })async {
   try {
      PhoneAuthCredential credential = await PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode);
      await auth.signInWithCredential(credential).then((value) {
        if (value != null) {
          // cloudStore.collection('users').doc(value.user!.uid).set(
          //     ItemModel!.toJson()
          // );
          Get.offAll(Home());
        }
      });
    }on FirebaseAuthException catch(e)
   {
     Get.defaultDialog(
       title: 'failed',
       content: Text(e.code),
     );
   }
  }


  logOut() async {
    await auth.signOut();
  }


  addItemToFirebase({required ItemModel ItemModel}) async
  { try {
    await cloudStore
        .collection('products')
        .doc('${auth.currentUser?.uid}')
        .collection('listOfItems')
        .doc(ItemModel.time)
        .set(ItemModel.toJson());
  }on FirebaseException catch(e)
  {
    Get.defaultDialog(
      title: 'failed',
      content: Text(e.code),
    );
  }
  }


  addUserToFirebase({required UserModel UserModel}) async {
    await cloudStore
        .collection('users')
        .doc('${auth.currentUser?.uid}')
        .set(UserModel.toJson());
  }

  //  getDataFromFirebase () async
  // {
  //   var firebaseData = await store
  //       .collection('products')
  //       .doc('${auth.currentUser?.uid}')
  //       .collection('listOfItems').get();
  //
  //   firebaseData.docs.forEach((element)
  //   {
  //     ItemModel.fromJson(element.data());
  //   });
  //}

  Future<String> uploadImageToFirebaseStorage ({required String imagePath , required imageName }) async
  {
     final path = storage.ref().child('product image / ${imageName.toString()}');
     final uploadImage =  path.putFile(File(imagePath.toString()));
     final imageUrl = (await(await uploadImage).ref.getDownloadURL()).toString() ;
     return imageUrl ;
  }

}


