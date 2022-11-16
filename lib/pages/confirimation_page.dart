import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ufs_field_agent/pages/questionnaire_form.dart';

import '../widgets/app_colors.dart';
import '../widgets/button_widgets.dart';
import '../widgets/text_widget.dart';

class ConfrimationPage extends StatelessWidget {
  final Completer<GoogleMapController> controller = Completer();
  final CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  final CameraPosition kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
              ]),
            ),
            const SizedBox(
              height: 45,
            ),
            SizedBox(
              height: 200,
              width: Get.width,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: kGooglePlex,
                onMapCreated: (GoogleMapController controller) {},
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: ()=>Get.to(QuestionnaireForm()),
                    child: button_widgets(
                        color: AppColors().lightColor,
                        height: 60,
                        width: 225,
                        radius: 10,
                        borderColor: 0xffFF9C27B0,
                        widget: Center(
                            child: text_widget(
                          color: AppColors().whiteColor,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          font: "Nunito",
                          fontSize: 18,
                          text: "Confirm",
                        ))),
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: button_widgets(
                      color: 0xffF37A3D,
                      height: 60,
                      width: 225,
                      radius: 10,
                      borderColor: 0xffFF9C27B0,
                      widget: Center(
                          child: text_widget(
                        color: AppColors().whiteColor,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.center,
                        font: "Nunito",
                        fontSize: 18,
                        text: "Cancel",
                      ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
