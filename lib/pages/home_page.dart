// ignore_for_file: sort_child_properties_last

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ufs_field_agent/pages/profile.dart';
import 'package:ufs_field_agent/pages/questionair_list.dart';
import 'package:ufs_field_agent/pages/to_do_list_page.dart';
import 'package:ufs_field_agent/pages/training_list.dart';
import 'package:ufs_field_agent/widgets/app_colors.dart';

import '../controllers/home_controller.dart';
import '../widgets/text_widget.dart';
import 'questionnaire_form.dart';
import 'questionnaire_view.dart';

class HomePage extends GetView<HomeController> {
  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(AppColors().fadedWhiteColor),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(AppColors().lightColor),
          title: text_widget(
            color: AppColors().whiteColor,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.center,
            font: "Nunito",
            fontSize: 20,
            text: "Field Agent Dashborad",
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Container(
          width: Get.width,
          height: 80,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Obx((() => InkWell(
                          onTap: () {
                            controller.changeVal(0);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.home,
                                size: 24,
                                color: controller.homeIndex.value != 0
                                    ? Color(AppColors().greyColor)
                                    : Color(AppColors().lightColor),
                              ),
                              text_widget(
                                color: controller.homeIndex.value != 0
                                    ? AppColors().greyColor
                                    : AppColors().lightColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Nunito",
                                fontSize: 14,
                                text: "Home",
                              ),
                            ],
                          ),
                        ))),
                    Obx((() => InkWell(
                          onTap: () {
                            controller.changeVal(1);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.account_circle,
                                size: 24,
                                color: controller.homeIndex.value != 1
                                    ? Color(AppColors().greyColor)
                                    : Color(AppColors().lightColor),
                              ),
                              text_widget(
                                color: controller.homeIndex.value != 1
                                    ? AppColors().greyColor
                                    : AppColors().lightColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Nunito",
                                fontSize: 14,
                                text: "Profile",
                              ),
                            ],
                          ),
                        ))),
                    Obx((() => InkWell(
                          onTap: () {
                            controller.changeVal(2);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.info,
                                size: 24,
                                color: controller.homeIndex.value != 2
                                    ? Color(AppColors().greyColor)
                                    : Color(AppColors().lightColor),
                              ),
                              text_widget(
                                color: controller.homeIndex.value != 2
                                    ? AppColors().greyColor
                                    : AppColors().lightColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Nunito",
                                fontSize: 14,
                                text: "About",
                              ),
                            ],
                          ),
                        ))),
                    Obx((() => InkWell(
                          onTap: () {
                            controller.changeVal(3);
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.phone,
                                size: 24,
                                color: controller.homeIndex.value != 3
                                    ? Color(AppColors().greyColor)
                                    : Color(AppColors().lightColor),
                              ),
                              text_widget(
                                color: controller.homeIndex.value != 3
                                    ? AppColors().greyColor
                                    : AppColors().lightColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Nunito",
                                fontSize: 14,
                                text: "Contact",
                              ),
                            ],
                          ),
                        ))),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Obx(
          () => controller.homeIndex.value==0? ListView(
            children: [
              Container(
                width: Get.width,
                // height: 140,
                color: Color(AppColors().lightColor),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: text_widget(
                        color: AppColors().greyColor,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        font: "Nunito",
                        fontSize: 18,
                        text: "Overview",
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      height: 300,
                      child: Stack(
                        children: [
                          PieChart(
                            PieChartData(
                                pieTouchData: PieTouchData(
                                    touchCallback: (FlTouchEvent event,
                                        pieTouchResponse) {}),
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 0,
                                centerSpaceRadius: 100,
                                sections: showingSections()),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: text_widget(
                                    color: AppColors().darkColorNo,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.center,
                                    font: "Nunito",
                                    fontSize: 30,
                                    text: "0",
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: text_widget(
                                  color: AppColors().darkColorNo,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.center,
                                  font: "Nunito",
                                  fontSize: 14,
                                  text: "Total Tasks",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Image.asset(
                                    "assets/ic_support_list.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: text_widget(
                                      color: AppColors().darkColorNo,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                      font: "Nunito",
                                      fontSize: 16,
                                      text: "Support",
                                    ),
                                  ),
                                ]),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                    color: Color(AppColors().greyColor)),
                                bottom: BorderSide(
                                    color: Color(AppColors().greyColor)),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: (() => Get.to(TrainingList())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Image.asset(
                                    "assets/ic_training.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: text_widget(
                                      color: AppColors().darkColorNo,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                      font: "Nunito",
                                      fontSize: 16,
                                      text: "Training",
                                    ),
                                  ),
                                ]),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                    color: Color(AppColors().greyColor)),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (() => Get.to(QuestionnairList())),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Image.asset(
                                    "assets/ic_quiz_lis.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: text_widget(
                                      color: AppColors().darkColorNo,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                      font: "Nunito",
                                      fontSize: 16,
                                      text: "Questionnare",
                                    ),
                                  ),
                                ]),
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                right: BorderSide(
                                    color: Color(AppColors().greyColor)),
                              )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => Get.to(ToDoList()),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  Image.asset(
                                    "assets/ic_todo_list.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: text_widget(
                                      color: AppColors().darkColorNo,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                      font: "Nunito",
                                      fontSize: 16,
                                      text: "To-Do List",
                                    ),
                                  ),
                                ]),
                              ),
                              decoration: const BoxDecoration(border: Border()),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ):ProfilePage(),
        ));
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff2A9D8F),
            value: 5.0,
            radius: radius,
            showTitle: false,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xffE76F51),
            value: 5.0,
            radius: radius,
            showTitle: false,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff4FCD51),
            value: 10.0,
            showTitle: false,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
