import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ufs_field_agent/widgets/app_colors.dart';

import '../apis/app_model.dart';
import '../pages/home_page.dart';
import '../widgets/text_widget.dart';

class LoginController {
  //form key for the forms....
  final formKey = GlobalKey<FormBuilderState>();
  //variables......
  RxBool isLoading = false.obs;

  //......function......//
  void loginFunction(String username, String password) {
    AppModel().getAccessToken(username, password, () {
      //successful
      Get.offAll(HomePage());
      changeIsLoading();
      showSnackBar("Authentication", "Successfully logged in as $username");
      saveEmail(username);
    }, (error) {
      //failed
      showSnackBar("Authentication", "$error");
      changeIsLoading();
    }, (exception) {
      //exceptionFunction
      showSnackBar("Authentication", "$exception");
      changeIsLoading();
    });
  }

  //change the loading.....
  void changeIsLoading() {
    isLoading.toggle();
  }

  //snackBar......
  void showSnackBar(String title, String msg) {
    Get.snackbar(title, msg,
        backgroundColor: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 10,
        colorText: Color(AppColors().darkColorNo));
  }

  //save the email to the local storage....
  void saveEmail(String email) async {
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    if (prefs.getString("email") != null) {
      showSnackBar(
          "Authentication", "You are now approved to authorized functions.");
    }
  }
}
