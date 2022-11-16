import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ufs_field_agent/controllers/questionnaire_controller.dart';

import '../apis/app_model.dart';
import '../widgets/app_colors.dart';
import '../widgets/text_widget.dart';
import 'questionnaire_view.dart';

class QuestionnairePage extends GetView<QuestionnaireController> {
  final int idNo;

  QuestionnairePage(this.idNo);
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
          text: "Task Type",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  text_widget(
                    color: AppColors().greyColor,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    font: "Roboto",
                    fontSize: 20,
                    text: "Choose a Questionnaire",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: AppModel().getFieldTaskByID(idNo.toString()),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: const Text("No records found try again later"),
                    );
                  }
                  return  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(QuestionnaireView()),
                          child: Container(
                            width: Get.width,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffF26722)
                                    ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: text_widget(
                                  color: AppColors().darkColorNo,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                  font: "Roboto",
                                  fontSize: 15,
                                  text: "Visiting",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: Get.width,
                          height: 40,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: text_widget(
                                color: AppColors().greyColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Roboto",
                                fontSize: 15,
                                text: "Training",
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xffCCCCCC)),
                              )),
                        ),
                        Container(
                          width: Get.width,
                          height: 40,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: text_widget(
                                color: AppColors().darkColorNo,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Roboto",
                                fontSize: 15,
                                text: "Merchandize",
                              ),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Color(0xffCCCCCC)),
                          )),
                        ),
                        Container(
                          width: Get.width,
                          height: 40,
                          // ignore: sort_child_properties_last
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: text_widget(
                                color: AppColors().greyColor,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                font: "Roboto",
                                fontSize: 15,
                                text: "Fraud",
                              ),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                            bottom: BorderSide(color: Color(0xffCCCCCC)),
                          )),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
