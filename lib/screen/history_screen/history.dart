

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tender3/module/module.dart';
import 'package:tender3/screen/history_screen/controllers/history_controller.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({Key? key}) : super(key: key);
final control = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          children: [
           FutureBuilder(
             future: control.getDataFromFirebase(),
               builder: (context , snapshot)
               {
                 return  ListView.builder(
                     shrinkWrap: true,
                     physics: const NeverScrollableScrollPhysics(),
                     itemCount:control.time.length ,
                     itemBuilder: (BuildContext context , i )
                     {
                       return ItemShape(
                           date: control.time[i].time.toString() ,
                           time: control.time[i].date.toString(),
                           pieces: control.time[i].pieces.toString(),
                         imageUrl: control.time[i].imageUrl.toString(),
                       );
                     }
                 );
               }
           ),
            // GetX<HistoryController>(
            //   init: HistoryController(),
            //     builder:(controller)=>ListView.builder(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount:control.time.length ,
            //         itemBuilder: (BuildContext context , i )
            //         {
            //           return Module(
            //               date: control.time[i].time.toString() ,
            //               time: control.time[i].date.toString(),
            //               pieces: control.time[i].pieces.toString()
            //           );
            //         }
            //     ), )
            // Obx(() => ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount:control.time.length ,
            //     itemBuilder: (controller , i )
            //     {
            //       return Module(
            //           date: control.time[i].time.toString() ,
            //           time: control.time[i].date.toString(),
            //           pieces: control.time[i].pieces.toString()
            //       );
            //     }
            // ),)
          ],
        ),
      ),
    );
  }
}
