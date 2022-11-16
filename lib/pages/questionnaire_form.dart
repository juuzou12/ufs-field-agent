import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ufs_field_agent/controllers/questionnaire_controller.dart';
import 'package:ufs_field_agent/pages/success_page.dart';

import '../widgets/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/text_widget.dart';

class QuestionnaireForm extends GetView<QuestionnaireController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColors().lightColor),
        elevation: 0,
        title: text_widget(
          color: AppColors().whiteColor,
          fontWeight: FontWeight.w700,
          textAlign: TextAlign.center,
          font: "Nunito",
          fontSize: 18,
          text: "Questionnaire Form",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: text_widget(
              color: AppColors().greyColor,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              font: "Nunito",
              fontSize: 15,
              text: "1. Has Questionnaire Form",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: Color(AppColors().greyColor),
                  size: 18,
                ),
                text_widget(
                  color: AppColors().greyColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 14,
                  text: "Yes",
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank,
                  color: Color(AppColors().greyColor),
                  size: 18,
                ),
                text_widget(
                  color: AppColors().greyColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 14,
                  text: "Now",
                ),
              ],
            ),
          ),
           InkWell(
             onTap: ()=>Get.to(SuccessPage()),
             child: button_widgets(
                        color: 0xffF37A3D,
                        height: 60,
                        width: Get.width,
                        radius: 10,
                        borderColor: 0xffFF9C27B0,
                        widget: Center(
                            child: text_widget(
                          color: AppColors().whiteColor,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Nunito",
                          fontSize: 18,
                          text: "Submit",
                        ))),
           ),
        ]),
      ),
    );
  }
}
