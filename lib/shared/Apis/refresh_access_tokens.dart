import 'dart:convert';
import 'package:edusphere_mobile/features/account/backend/auth_logout.dart';
import 'package:edusphere_mobile/shared/Apis/apis_req_endpoint.dart';
import 'package:edusphere_mobile/shared/Storage/app_local_data.dart';
import 'package:edusphere_mobile/shared/tokens_manager.dart';
import 'package:edusphere_mobile/shared/widgets/shared_ui_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:http/http.dart" as http;

Future<void> refreshAccessTokens(BuildContext context, String? token) async {
  try {
    loaderDailog(context);
    print("value of token is : ${TokensManager.refreshToken}");

    final response = await http.post(
      Uri.parse(ApisReqEndpoint.refreshTokenEndpoint()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      },
      body: jsonEncode(
        {"refreshTokens": token},
      ),
    );
    print(response.body);
    Navigator.pop(context);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'];
      TokensManager.accessToken = data['accessToken'];
      TokensManager.refreshToken = data['refreshToken'];
      await AppLocalData.storeTokens();

      Fluttertoast.showToast(
          msg: "Tokens successfully refreshed!", backgroundColor: Colors.green);
    } else {
      await AuthLogout.logoutCurrentUser(context);

      Fluttertoast.showToast(
          msg: "Failed to update tokens! Please login again",
          backgroundColor: Colors.red);
    }
  } catch (e) {
    Navigator.pop(context);
    await AuthLogout.logoutCurrentUser(context);

    if (kDebugMode) {
      print('Error refreshing tokens: $e');
    }
  }
}
