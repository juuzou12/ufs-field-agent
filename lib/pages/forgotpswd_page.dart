import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ufs_field_agent/apis/app_model.dart';
import 'package:ufs_field_agent/controllers/login_controller.dart';
import 'package:ufs_field_agent/pages/login_page.dart';

import '../widgets/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/formbuildtextfield.dart';
import '../widgets/text_widget.dart';

class ForgetPasswordPage extends GetView<LoginController> {
  final formKey = GlobalKey<FormBuilderState>();
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
      body: Column(children: [
        const Expanded(
          child: SizedBox(
            height: 16,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: text_widget(
            color: AppColors().darkColorNo,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
            font: "Lato",
            fontSize: 16,
            text: "Enter your new password to reset your password.",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            FormBuilder(
              key: formKey,
                child: Column(
              children: [
                formbuildtextfield(
                    height: 50,
                    color: 0xff1F1C34,
                    hintText: "Enter your email",
                    attribute: "emailForget",
                    dividerColor: 0xff1F1C34,
                    errorText: "Enter an email first",
                    font: "Lato",
                    keybordType: TextInputType.emailAddress,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                    formType: "text",
                    dropDownList: [],
                    submitAction: () {}),
                const SizedBox(
                  height: 16,
                ),
              ],
            )),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Visibility(
                  visible: controller.isLoading.isFalse,
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        controller.changeIsLoading();
                        AppModel().resetPassowrd(formKey.currentState!.value['emailForget'], () {
                          //succesFull
                          controller.changeIsLoading();
                          controller.showSnackBar("Authentication",
                              "An email has been sent to your email");
                          Get.off(LoginPage());
                        }, (error) {
                          // failed
                          controller.showSnackBar("Authentication", "$error");
                          controller.changeIsLoading();
                        });
                      }
                    },
                    child: button_widgets(
                        color: AppColors().lightColor,
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
                          text: "Reset",
                        ))),
                  ),
                )),
            Obx((() => Visibility(
                visible: controller.isLoading.isTrue,
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    backgroundColor: Color(AppColors().lightColor),
                    color: Colors.grey,
                    strokeWidth: 3,
                  ),
                )))),
            const SizedBox(
              height: 30,
            ),
          ]),
        )
      ]),
    );
  }
}
