import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tender3/helpers/shared.dart';

class LogInController extends GetxController
{
  var email = TextEditingController(text: MyCache.GetString(key: MyChachKey.email));
  var password = TextEditingController(text: MyCache.GetString(key: MyChachKey.password));
  var formKey = GlobalKey<FormState>();
  bool show = true ;

  changeIcon()
  {
    show = !show ;
    update();
  }
}