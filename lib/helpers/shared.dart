import 'dart:async';



import 'package:shared_preferences/shared_preferences.dart';

class MyCache {
  static SharedPreferences? preferences;
  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void PutString({required MyChachKey key, required String value}) {
    preferences?.setString(key.name, value);
  }
  static String GetString({required MyChachKey key}) {
    return preferences?.getString(key.name) ?? "";
  }


 static void putInt({required MyChachKey key, required int value}) {
    preferences?.setInt(key.name, value);
  }
 static int GetInt({required MyChachKey key}) {
    return preferences?.getInt(key.name) ?? 0;
  }


 static void PutBool({required MyChachKey key, required bool value}) {
    preferences?.setBool(key.name, value);
  }
 static bool? GetBool({required MyChachKey key}) {
    return preferences?.getBool(key.name)?? false;
  }


  static void PutDouble({required MyChachKey key, required double value}) {
    preferences?.setDouble(key.name, value);
  }
 static double? GetDouble({required MyChachKey key}) {
    return preferences?.getDouble(key.name)?? 0.0;
  }
}
enum MyChachKey{

  email,
  password,
  onboarding,
}