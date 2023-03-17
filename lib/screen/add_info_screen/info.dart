import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:get/get.dart';

import '../../componant/Buttom.dart';
import '../../componant/Row_More_Inaformation.dart';
import '../../componant/Social.dart';
import '../../const/style.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController feedBackController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    ScrollController scrollController = ScrollController();
    AnimationController? controllerz;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Phone Numbers'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RowMoreInfoScreen(
                      text: '098r754e7483',
                      widget: const Icon(
                        Icons.phone,
                        color: K.primaryColor,
                      ));
                }),
            K.sizedBoxH,
            const Text('Socials'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: socials.length,
                itemBuilder: (context, index) {
                  return RowMoreInfoScreen(
                      text: '${socials[index]['text']}',
                      widget: socials[index]['icon']);
                }),
            K.sizedBoxH,
            Center(
              child: Button(
                width: MediaQuery.of(context).size.width / 2,
                height: Get.height / 20.h,
                onPressed: () {},
                text: 'Delete Account',
                isFramed: true,
              ),
            )
          ],
        ),
        floatingActionButton: ScrollingFabAnimated(
          color: K.primaryColor,
          icon: const Icon(Icons.contact_support, color: Colors.white),
          width: 150.h,
          text: Text(
            'Feedback',
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
          ),
          onPress: () {
            setState(() {
              showModalBottomSheet(
                  context: context,
                  transitionAnimationController: controllerz,
                  builder: (BuildContext context) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      child: Padding(
                          padding: EdgeInsets.only(
                            bottom: 10.h, //
                            // bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AnimatedCrossFade(
                            firstChild: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(20.sp),
                                    child: TextFormField(
                                      controller: feedBackController,
                                      decoration: InputDecoration(
                                        hintText: 'Send Feedback',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Colors.red)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Colors.black12)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: K.primaryColor)),
                                        disabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Colors.black12)),
                                      ),
                                      validator: (v) {
                                        if (v!.isEmpty || v == null) {
                                          return 'Please enter Some text';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Button(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    height: Get.height / 20.h,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        print('valid');
                                      } else {
                                        print('Not Valid');
                                      }
                                    },
                                    text: 'send feedback',
                                    isFramed: false,
                                  )
                                ],
                              ),
                            ),
                            secondChild: Text('try'),
                            crossFadeState: CrossFadeState.showFirst,
                            duration: Duration(seconds: 1),
                          )),
                    );
                  });
            });
          },
          scrollController: scrollController,
        ));
  }
}
