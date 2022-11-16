import 'package:flutter/material.dart';
import 'package:ufs_field_agent/widgets/app_colors.dart';

import '../widgets/text_widget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors().fadedWhiteColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Color(AppColors().whiteColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text_widget(
                  color: AppColors().lightColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 20,
                  text: "SAM OFULA",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text_widget(
                  color: AppColors().darkColorNo,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 15,
                  text: "samofula@gmail.com",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text_widget(
                  color: AppColors().lightColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 15,
                  text: "Change password",
                ),
              ),
              Icon(
                Icons.edit,
                color: Color(AppColors().lightColor),
                size: 20,
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Color(AppColors().greyColor),
                size: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: text_widget(
                  color: AppColors().greyColor,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Nunito",
                  fontSize: 15,
                  text: "Logout",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
