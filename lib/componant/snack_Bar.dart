import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
        child: Text(
      message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
    )),
    duration: const Duration(seconds: 5),
    backgroundColor: Colors.black.withOpacity(.5),
  ));
}
