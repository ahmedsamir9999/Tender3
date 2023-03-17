import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tender3/model/model.dart';

class Services {
  final auth = FirebaseAuth.instance;
  final cloudStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance ;

  signIn({emailSignIn, passwordSignIn}) async {
    await auth.signInWithEmailAndPassword(
        email: emailSignIn, password: passwordSignIn);
  }

  register({required emailSignUp, required passwordSignUp}) async {
    await auth.createUserWithEmailAndPassword(
        email: emailSignUp, password: passwordSignUp);
  }

  logOut() async {
    await auth.signOut();
  }


  addItemToFirebase({required ItemModel ItemModel}) async {
    await cloudStore
        .collection('products')
        .doc('${auth.currentUser?.uid}')
        .collection('listOfItems')
        .doc(ItemModel.time)
        .set(ItemModel.toJson());
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

  Future<String> uploadImageToFirebaseStorage ({required String imagePath , required imageName })async
  {
     final path = storage.ref().child('product image / ${imageName.toString()}');
     final uploadImage = await path.putFile(File(imagePath.toString()));
     final imageUrl = ((uploadImage).ref.getDownloadURL()).toString() ;
     return imageUrl ;
  }

}


