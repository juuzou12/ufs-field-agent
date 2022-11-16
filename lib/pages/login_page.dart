// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:ufs_field_agent/apis/app_model.dart';
import 'package:ufs_field_agent/controllers/login_controller.dart';

import '../widgets/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/formbuildtextfield.dart';
import '../widgets/text_widget.dart';
import 'forgotpswd_page.dart';
import 'home_page.dart';

class LoginPage extends GetView<LoginController> {
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
      backgroundColor: Color(AppColors().fadedWhiteColor),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          const SizedBox(
            height: 250,
          ),
          Align(
            alignment: Alignment.center,
            child: text_widget(
              color: AppColors().darkColorNo,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 25,
              text: "Field Agent",
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.center,
            child: text_widget(
              color: AppColors().darkColorNo,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              font: "Lato",
              fontSize: 16,
              text: "Kindly login to access the dashboard.",
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
                          hintText: "Enter email",
                          attribute: "email",
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
                      formbuildtextfield(
                          height: 50,
                          color: 0xff1F1C34,
                          hintText: "Enter password",
                          attribute: "password",
                          dividerColor: 0xff1F1C34,
                          errorText: "Enter a password first",
                          font: "Lato",
                          keybordType: TextInputType.text,
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
                          // Get.offAll(HomePage());
                          controller.loginFunction(
                              formKey.currentState!.value['email'],
                              formKey.currentState!.value['password']);
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
                            text: "Login",
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
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () => Get.to(ForgetPasswordPage()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: text_widget(
                      color: AppColors().darkColorNo,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 14,
                      text: "Forgot password",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
