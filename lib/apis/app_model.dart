// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/adapter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppModel {
  final String baseUrl =
      "http://41.215.130.247:8651/ufs-common-modules/api/v1/";
  final String baseUrlFieldAgent =
      "http://41.215.130.247:8651/ufs-fieldagent-api/api/v1/";

  String? token;
  String? basicAuth;
  // ignore: non_constant_identifier_names
  String? BearerToken = "7cd84a5d-4bb0-4a35-ab1f-c4590f367d2b";
  Dio? dio, filedAgentDio;

  AppModel() {
    // ignore: non_constant_identifier_names
    String Username = "common_module_client";
    // ignore: non_constant_identifier_names
    String Password = "secret";

    basicAuth = 'Basic ${base64Encode(utf8.encode('$Username:$Password'))}';

    /*basicAuth='$Username:$Password';*/

    print(basicAuth);

    Map<String, String> headers = {};

    headers.putIfAbsent(
        Headers.acceptHeader, () => ContentType.json.toString());

    dio = Dio(
      BaseOptions(
          connectTimeout: 30000,
          baseUrl: baseUrl,
          responseType: ResponseType.json,
          headers: headers,
          contentType: ContentType.json.toString(),
          validateStatus: (v) => true),
    );
    filedAgentDio = Dio(
      BaseOptions(
          connectTimeout: 30000,
          baseUrl: baseUrlFieldAgent,
          responseType: ResponseType.json,
          headers: headers,
          contentType: ContentType.json.toString(),
          validateStatus: (v) => true),
    );
    dio!.options.contentType = Headers.formUrlEncodedContentType;
    dio!.options.contentType = Headers.jsonContentType;
    filedAgentDio!.options.contentType = Headers.formUrlEncodedContentType;
    filedAgentDio!.options.contentType = Headers.jsonContentType;
    // (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //     (HttpClient client) {
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) =>
    //           "41.215.130.247" == host;
    //   return client;
    // };
  }

  /*login to your account*/
  Future<void> getAccessToken(String username, String password, successful,
      failed, exceptionFunction) async {
    try {
      String uri =
          "oauth/token?username=$username&password=$password&grant_type=password";

      var dataSent = {
        "username": username,
        "password": password,
        "grant_type": "password"
      };

      // var payLoad = FormData.fromMap(dataSent);
      // print("This is the data sent.................." + dataSent.toString());
      Response loginResponse = await dio!.post(uri,
          // data: dataSent,
          options: Options(headers: {
            'Authorization': "$basicAuth",
          }, contentType: Headers.formUrlEncodedContentType));
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // print(loginResponse.statusCode);

      switch (loginResponse.statusCode) {
        case 200:
          successful();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          String? beareaToke = prefs.getString("access_token");
          loginUserAccount(dataSent, successful(), failed());
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 400:
          failed("${loginResponse.data['message']}");
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 404:
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          failed(loginResponse.statusMessage);
          break;
        case 410:
          failed(loginResponse.statusMessage);
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
      }
      return loginResponse.data;
    } catch (exception) {
      print(exception);
      exceptionFunction("Connecting timed out [30000ms]");
    }
  }

  //reset-password
  Future<void> resetPassowrd(var email, succesFull, failed) async {
    try {
      String uri = "/reset-password";
      var dataSent = {"email": email};
      var payLoad = FormData.fromMap(dataSent);
      // print("This is the data sent.................." + dataSent.toString());
      Response loginResponse = await dio!.post(uri,
          data: payLoad,
          options: Options(
            headers: {'Authorization': " Bearer $BearerToken"},
          ));
      // ignore: invalid_use_of_visible_for_testing_member
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // print(loginResponse.statusCode);

      switch (loginResponse.statusCode) {
        case 200:
          succesFull();
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 400:
          failed(
              "Sorry password  validation failed. The password should have  atleast 8 alphanumeric characters, 1 letter(s), 4 number(s), 1 lowercase character(s) , 1 special character and 1 uppercase character(s)");
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 404:
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          failed(loginResponse.statusMessage);
          break;
        case 410:
          failed(loginResponse.statusMessage);
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
      }
      return loginResponse.data;
    } catch (exception) {
      print(exception);
      failed("Connecting timed out [30000ms]");
    }
  }

  //change password first time login...
  Future<void> changePasswordFirstTym(var password, succesFull, failed) async {
    String uri = "/ufs-common-modules/api/v1/change-password/first-time";
    var payLoad = {"password": password};
    await dio!
        .post(uri, data: payLoad)
        .then((value) => succesFull())
        .onError((error, stackTrace) => failed());
  }

  //change password......
  Future<void> changePassword(
      var oldPassword, var password, succesFull, failed) async {
    try {
      SharedPreferences.setMockInitialValues({});
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String uri = "/change-password";
      var dataSent = {
        "oldPassword": oldPassword,
        "newPassword": password,
        "email": prefs.getString("email")
      };
      // var payLoad = FormData.fromMap(dataSent);
      // print("This is the data sent.................." + dataSent.toString());
      Response loginResponse = await dio!.post(uri,
          data: dataSent,
          options: Options(
            headers: {'Authorization': " Bearer $BearerToken"},
          ));
      // ignore: invalid_use_of_visible_for_testing_member

      // print(loginResponse.statusCode);

      switch (loginResponse.statusCode) {
        case 200:
          succesFull();
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 400:
          failed(
              "Sorry password  validation failed. The password should have  atleast 8 alphanumeric characters, 1 letter(s), 4 number(s), 1 lowercase character(s) , 1 special character and 1 uppercase character(s)");
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
        case 404:
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          failed(loginResponse.statusMessage);
          break;
        case 410:
          failed(loginResponse.statusMessage);
          print("${loginResponse.statusCode} ${loginResponse.statusMessage}");
          break;
      }
      return loginResponse.data;
    } catch (exception) {
      print(exception);
      failed("Connecting timed out [30000ms]");
    }
  }

  //login using ufs-field-agent.....
  Future<void> loginUserAccount(var payLoad, succesFull, failed) async {
    String uri = "/ufs-common-modules/api/v1/user/login-field-agent";

    await dio!
        .post(uri, data: payLoad)
        .then((value) => succesFull())
        .onError((error, stackTrace) => failed());
  }

  //verification of  OTP......
  Future<void> verifyOTP(var otp, succesFull, failed) async {
    String uri = "/ufs-common-modules/api/v1/otp/verification";
    var payLoad = {"otp": otp};
    await dio!
        .post(uri, data: payLoad)
        .then((value) => succesFull())
        .onError((error, stackTrace) => failed());
  }

  //question_types
  Future<Map<String, dynamic>> questionType(
      String query, function, Succesfulfunction) async {
    try {
      String uri = "/question_types";
      SharedPreferences prefs = await SharedPreferences.getInstance();
      BearerToken = prefs.getString("access_token");
      Response resp = await dio!.get(uri,
          options: Options(
            headers: {
              'Authorization': " Bearer $BearerToken",
            },
          ));
      if (resp.statusCode == 200) {
        Succesfulfunction();
      }

      return resp.data;
    } catch (exception) {
      function();
      print("..............." + exception.toString());
      if (exception.toString() == "Invalid argument(s)") {
        return {
          'message':
              'An error occur, please check your VAT number and try again'
        };
      } else {
        return {
          'code': 500,
          'message':
              'An error occur, please check your VAT number and try again'
        };
      }
    }
  }


  //send questionnaire feedback
  Future<void> questionFeedback(var feedbackPayload, succesFull, failed) async {
    String uri = "/question_feedback";
    var payLoad = {"payload": feedbackPayload};
    await dio!
        .post(uri, data: payLoad)
        .then((value) => succesFull())
        .onError((error, stackTrace) => failed());
  }

  //get tasks by ID....
  Future<Map<String, dynamic>> getFieldTask() async {
    try {
      String uri = "fieldTask";
      var resp = await filedAgentDio!.get(uri,
          options: Options(
            headers: {
              'Authorization': " Bearer $BearerToken",
            },
          ));
      // taskData = resp.data["data"]["content"];
      print(
          "---getUserTasks:${ resp.data["data"]["content"]}----------${resp.statusMessage}");
      return {
        'code': 200,
        'body': resp.data["data"]["content"],
        'message':
            'An error occured when performing your request, please try again'
      };
    } catch (e) {
      return {
        'code': 500,
        'message':
            'An error occured when performing your request, please try again'
      };
    }
  }

  Future<Map<String, dynamic>> getFieldTaskByID(String id) async {
    try {
      String uri = "fieldTask/$id";
      var resp = await filedAgentDio!.get(uri,
          options: Options(
            headers: {
              'Authorization': " Bearer $BearerToken",
            },
          ));
      // taskData = resp.data["data"]["content"];
      print(
          "---getUserTasks by $id:${ resp.data["data"]}----------${resp.statusMessage}");
      return {
        'code': 200,
        'body': resp.data["data"],
        'message':
            'An error occured when performing your request, please try again'
      };
    } catch (e) {
      return {
        'code': 500,
        'message':
            'An error occured when performing your request, please try again'
      };
    }
  }

  Future<Map<String, dynamic>> getQuestionnares() async {
    try {
      String uri = "questionnaire";
      var resp = await filedAgentDio!.get(uri,
          options: Options(
            headers: {
              'Authorization': " Bearer $BearerToken",
            },
          ));
      // taskData = resp.data["data"]["content"];
      print(
          "---Questions by ${ resp.data["data"]}----------${resp.statusMessage}");
      return {
        'code': 200,
        'body': resp.data["data"]['content'],
        'message':
            'An error occured when performing your request, please try again'
      };
    } catch (e) {
      return {
        'code': 500,
        'message':
            'An error occured when performing your request, please try again'
      };
    }
  }
}
