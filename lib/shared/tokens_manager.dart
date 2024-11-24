import 'dart:convert';
import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class TokensManager {
  static String? accessToken;
  static String? refreshToken;

  static Future<void> refreshAllTokens(BuildContext context) async {
    try {
      if (refreshToken != null) {
        final response = await http.post(
          ApisReqEndpoint.refreshTokenEndpoint(),
          headers: {'Authorization': 'Bearer $refreshToken'},
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);

          accessToken = data['accessToken'];
          refreshToken = data['refreshToken'];

          AppLocalData.storeTokens();
        } else {
          Fluttertoast.showToast(msg: "Please login again!");
          AppLocalData.clearAllData();
          navigateToLoginScreen(context);
        }
      } else {
        Fluttertoast.showToast(msg: "Please login again!");
        AppLocalData.clearAllData();
        navigateToLoginScreen(context);
      }
    } catch (e) {
      // Error handling
      if (kDebugMode) {
        print('Error refreshing tokens: $e');
      }
      Fluttertoast.showToast(msg: "Error: $e");
    }
  }

  static void navigateToLoginScreen(BuildContext context) {
    // Navigator.of(context).pushReplacementNamed('/login');
  }
}
