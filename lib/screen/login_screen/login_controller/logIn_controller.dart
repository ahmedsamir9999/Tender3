import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController
{
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool show = true ;

  changeIcon()
  {
    show = !show ;
    update();
  }
}