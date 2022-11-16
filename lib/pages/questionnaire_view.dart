import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/text_widget.dart';
import 'confirimation_page.dart';

class QuestionnaireView extends StatelessWidget {
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
          text: "Training Details",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: text_widget(
                    color: AppColors().greyColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 18,
                    text: "Enter Merchant ID",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: text_widget(
                    color: 0xffCCCCCC,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 24,
                    text: "76860",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(AppColors().greyColor),
                )
              ]),
            ),
            SizedBox(
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: text_widget(
                    color: AppColors().greyColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 18,
                    text: "Terminal ID",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: text_widget(
                    color: 0xffCCCCCC,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 24,
                    text: "76860",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(AppColors().greyColor),
                )
              ]),
            ),
            SizedBox(
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: text_widget(
                    color: AppColors().greyColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 18,
                    text: "The last RRN done on the terminal",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: text_widget(
                    color: 0xffCCCCCC,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 24,
                    text: "76860",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(AppColors().greyColor),
                )
              ]),
            ),
            SizedBox(
              child: Column(children: [
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: text_widget(
                    color: AppColors().greyColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 18,
                    text: "Location ID",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(
                  child: text_widget(
                    color: 0xffCCCCCC,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Nunito",
                    fontSize: 24,
                    text: "NYERI",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 1,
                  color: Color(AppColors().greyColor),
                )
              ]),
            ),
            const SizedBox(
              height: 45,
            ),
            InkWell(
              onTap: () {
                Get.to(ConfrimationPage());
              },
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
                    text: "Send",
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
