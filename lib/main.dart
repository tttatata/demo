import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/bottom_bar.dart';
import 'package:shop_app/provider/user_provider.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/login_success/login_success_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/service/signin_service.dart';
import 'package:shop_app/service/signup_service.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SignInService _signInService = SignInService();
  @override
  void initState() {
    super.initState();
    _signInService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      // initialRoute: SplashScreen.routeName,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const BottomBar()
          : const SignInScreen(),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:shop_app/global_variables.dart';

// import 'package:shop_app/provider/user_provider.dart';

// import 'package:provider/provider.dart';
// import 'package:shop_app/routes.dart';
// import 'package:shop_app/screens/login_success/login_success_screen.dart';
// import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(
//       create: (context) => UserProvider(),
//     ),
//   ], child: const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pharmacy',
//       theme: ThemeData(
//         scaffoldBackgroundColor: GlobalVariables.backgroundColor,
//         colorScheme: const ColorScheme.light(
//           primary: GlobalVariables.secondaryColor,
//         ),
//         appBarTheme: const AppBarTheme(
//           elevation: 0,
//           iconTheme: IconThemeData(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       onGenerateRoute: (settings) => generateRoute(settings),
//       home: Provider.of<UserProvider>(context).user.token.isNotEmpty
//           ? const LoginSuccessScreen()
//           : const SignInScreen(),
//     );
//   }
// }
