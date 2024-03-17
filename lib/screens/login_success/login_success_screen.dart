import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/user_provider.dart';

import 'package:shop_app/screens/init_screen.dart';

class LoginSuccessScreen extends StatelessWidget {
  static const String routeName = "/login_success";

  const LoginSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          const SizedBox(height: 16),
          const Text(
            "Login Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            user.toJson(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, InitScreen.routeName);
              },
              child: const Text("Back to home"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
