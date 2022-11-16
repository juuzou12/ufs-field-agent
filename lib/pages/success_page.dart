import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufs_field_agent/widgets/app_colors.dart';

import '../widgets/button_widgets.dart';
import '../widgets/text_widget.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_literals_to_create_immutables
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Center(
            child: CircleAvatar(
                radius: 80,
                backgroundColor: const Color(0xffECF5FB),
                child: Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xffDBEFF8),
                    child: Icon(
                      Icons.check_circle,
                      size: 50,
                      color: Color(AppColors().lightColor),
                    ),
                  ),
                )),
          ),
          Center(
              child: text_widget(
            color: AppColors().greyColor,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            font: "Nunito",
            fontSize: 18,
            text: "Saved Successfully",
          )),
          button_widgets(
              color: 0xffF37A3D,
              height: 60,
              width: Get.width,
              radius: 10,
              borderColor: 0xffFF9C27B0,
              widget: Center(
                  child: text_widget(
                color: AppColors().whiteColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                font: "Nunito",
                fontSize: 18,
                text: "Back To Dashboard",
              ))),
        ]),
      ),
    );
  }
}
