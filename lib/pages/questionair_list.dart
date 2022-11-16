import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ufs_field_agent/apis/app_model.dart';
import 'package:ufs_field_agent/pages/questionnaire_page.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/to_do_list_controller.dart';
import '../widgets/app_colors.dart';
import '../widgets/text_widget.dart';

class QuestionnairList extends GetView<ToDoListController> {
  // List dataFromServer = [];
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
          text: "My Questionnares",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder(
            future: AppModel().getQuestionnares(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: const Text("No records found try again later"),
                );
              }
              return Column(
                children: [
                  Row(
                    children: [
                      text_widget(
                        color: AppColors().greyColor,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        font: "Roboto",
                        fontSize: 20,
                        text: snapshot.data != null &&
                                snapshot.data['code'] == 200
                            ? "Questionnares (${snapshot.data["body"].length})"
                            : "Questionnares (0)",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text_widget(
                        color: AppColors().lightColor,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        font: "Roboto",
                        fontSize: 15,
                        text: "My Questionnares",
                      ),
                      text_widget(
                        color: AppColors().greyColor,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        font: "Roboto",
                        fontSize: 15,
                        text: "All Questionnares",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                   snapshot.data != null &&
                                  snapshot.data['code'] == 200
                              ? Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        reverse: false,
                        itemCount: snapshot.data["body"].length,
                        itemBuilder: (BuildContext context, int index) {
                          return snapshot.data != null &&
                                  snapshot.data['code'] == 200
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => Get.to(QuestionnairePage(snapshot
                                        .data["body"][index]["id"])),
                                    child: Container(
                                      width: Get.width,
                                      // ignore: sort_child_properties_last
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                text_widget(
                                                  color: AppColors().greyColor,
                                                  fontWeight: FontWeight.w500,
                                                  textAlign: TextAlign.center,
                                                  font: "Roboto",
                                                  fontSize: 20,
                                                  text: snapshot.data["body"]
                                                          [index]["name"]
                                                      .toString(),
                                                ),
                                                text_widget(
                                                  color: AppColors().darkColorNo,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.center,
                                                  font: "Roboto",
                                                  fontSize: 13,
                                                  text: timeago.format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          snapshot.data["body"]
                                                                  [index]
                                                              ["createdAt"])),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: text_widget(
                                                color: AppColors().greyColor,
                                                fontWeight: FontWeight.w300,
                                                textAlign: TextAlign.center,
                                                font: "Roboto",
                                                fontSize: 14,
                                                text: snapshot.data["body"][index]
                                                        ["actionStatus"]
                                                    .toString(),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                text_widget(
                                                  color: AppColors().lightColor,
                                                  fontWeight: FontWeight.w300,
                                                  textAlign: TextAlign.center,
                                                  font: "Roboto",
                                                  fontSize: 14,
                                                  text: snapshot.data["body"]
                                                          [index]["status"]!="Pending"
                                                      ? "Done"
                                                      : "${snapshot.data["body"][index]["status"]}",
                                                ),
                                                text_widget(
                                                  color: AppColors().lightColor,
                                                  fontWeight: FontWeight.w500,
                                                  textAlign: TextAlign.center,
                                                  font: "Roboto",
                                                  fontSize: 13,
                                                  text: "view more",
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(AppColors().whiteColor),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox();
                        }),
                  ):const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(),
                  )
                ],
              );
            }),
      ),
    );
  }
}
