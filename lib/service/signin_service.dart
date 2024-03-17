import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/components/bottom_bar.dart';
import 'package:shop_app/error_handling.dart';
import 'package:shop_app/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/provider/user_provider.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInService {
  void signInpUser({
    required BuildContext context,
    required String password,
    required String email,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'password': password,
          'email': email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await preferences.setString(
              'x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-token', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );

        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
