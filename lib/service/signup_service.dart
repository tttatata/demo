import 'package:flutter/material.dart';
import 'package:shop_app/error_handling.dart';
import 'package:shop_app/models/User.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/utils.dart';

class SignUpService {
  //sign up
  //

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String phone,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          phone: phone,
          address: '',
          type: '',
          token: '');
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
