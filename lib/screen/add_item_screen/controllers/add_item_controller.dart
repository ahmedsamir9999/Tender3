import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../const/style.dart';

class AddItemController extends GetxController {
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var numPieces = TextEditingController();
  var address = TextEditingController();
  var formKey = GlobalKey<FormState>();
  File? image;
  Rx<Color> border = K.primaryColor.obs;
  RxBool isLoading = false.obs ;
  Rx<Color> color = K.primaryColor.obs;

  pickImage() async {
    final imagePick =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(imagePick!.path);
    update();
  }
}
