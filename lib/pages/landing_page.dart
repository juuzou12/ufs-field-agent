import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ufs_field_agent/pages/login_page.dart';

import '../widgets/app_colors.dart';
import '../widgets/text_widget.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        width: Get.width,
        color: Color(AppColors().fadedWhiteColor),
        child: Center(
          child: text_widget(
            color: AppColors().lightColor,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            font: "Lato",
            fontSize: 12,
            text: "Powered by Tracom",
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            "assets/landing_flash.png",
            width: Get.width,
            height: Get.height,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: text_widget(
                    color: AppColors().lightColor,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    font: "Lato",
                    fontSize: 20,
                    text: "Field Agent",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(LoginPage());
                      },
                      child: Container(
                        width: 100,
                        // ignore: sort_child_properties_last
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: text_widget(
                            color: AppColors().lightColor,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                            font: "Lato",
                            fontSize: 15,
                            text: "Login",
                          ),
                        ),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/ic_support_list.png",
                              width: 40,
                            ),
                          ),
                          Center(
                            child: text_widget(
                              color: AppColors().darkColorNo,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 14,
                              text: "Support",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/ic_training.png",
                              width: 40,
                            ),
                          ),
                          Center(
                            child: text_widget(
                              color: AppColors().darkColorNo,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 14,
                              text: "Training",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/ic_todo_list.png",
                              width: 40,
                            ),
                          ),
                          Center(
                            child: text_widget(
                              color: AppColors().darkColorNo,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 14,
                              text: "To-Do List",
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/ic_quiz_lis.png",
                              width: 40,
                            ),
                          ),
                          Center(
                            child: text_widget(
                              color: AppColors().darkColorNo,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.center,
                              font: "Lato",
                              fontSize: 14,
                              text: "Questionnaire",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
