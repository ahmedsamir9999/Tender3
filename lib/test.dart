import 'package:flutter/material.dart';
import 'package:tender3/services/services.dart';

import 'componant/Buttom.dart';

class Test extends StatelessWidget {
   Test({Key? key}) : super(key: key);

  final ser = Services() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Button(
          width: 200,
          height: 50,
          onPressed: ()
          {
            ser.sendVerificationCode(phone: '+201205681612');
          },
          isFramed: true,
          text: 'test',
        )
      ),
    );
  }
}
