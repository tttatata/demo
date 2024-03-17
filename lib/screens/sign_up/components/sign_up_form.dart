// import 'package:flutter/material.dart';
// import 'package:shop_app/common/widgets/custom_button.dart';
// import 'package:shop_app/common/widgets/custom_textfield.dart';

// import 'package:shop_app/service/signup_service.dart';

// import '../../../components/custom_surfix_icon.dart';
// import '../../../components/form_error.dart';
// import '../../../constants.dart';
// import '../../complete_profile/complete_profile_screen.dart';

// enum Signup {
//   signup,
// }

// class SignUpForm extends StatefulWidget {
//   const SignUpForm({super.key});

//   @override
//   State<SignUpForm> createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   Signup _signup = Signup.signup;
//   final _signUpFormKey = GlobalKey<FormState>();

//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final SignUpService _signUpService = SignUpService();
//   final List<String?> errors = [];
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//   }

//   void signUpUser() {
//     _signUpService.signUpUser(
//       context: context,
//       email: _emailController.text,
//       password: _passwordController.text,
//       name: _nameController.text,
//       phone: _phoneController.text,
//     );
//   }

//   void addError({String? error}) {
//     if (!errors.contains(error)) {
//       setState(() {
//         errors.add(error);
//       });
//     }
//   }

//   void removeError({String? error}) {
//     if (errors.contains(error)) {
//       setState(() {
//         errors.remove(error);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _signUpFormKey,
//       child: Column(children: [
//         CustomTextField(
//           controller: _nameController,
//           hintText: 'Họ Tên',
//         ),
//         const SizedBox(height: 10),
//         CustomTextField(
//           controller: _phoneController,
//           hintText: 'Số điện thoại',
//         ),
//         const SizedBox(height: 10),
//         CustomTextField(
//           controller: _emailController,
//           hintText: 'Email',
//         ),
//         const SizedBox(height: 10),
//         CustomTextField(
//           controller: _passwordController,
//           hintText: 'Mật khẩu đăng nhậpl',
//         ),
//         const SizedBox(height: 10),
//         CustomButton(
//             text: 'Đăng nhập ',
//             onTap: () {
//               if (_signUpFormKey.currentState!.validate()) {
//                 signUpUser();
//               }
//             })
//       ]),
//     );
//   }
// }
// // //////////
// // import 'package:flutter/material.dart';

// // import '../../../components/custom_surfix_icon.dart';
// // import '../../../components/form_error.dart';
// // import '../../../constants.dart';
// // import '../../complete_profile/complete_profile_screen.dart';

// // class SignUpForm extends StatefulWidget {
// //   const SignUpForm({super.key});

// //   @override
// //   _SignUpFormState createState() => _SignUpFormState();
// // }

// // class _SignUpFormState extends State<SignUpForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   String? email;
// //   String? password;
// //   String? conform_password;
// //   bool remember = false;
// //   final List<String?> errors = [];

// //   void addError({String? error}) {
// //     if (!errors.contains(error)) {
// //       setState(() {
// //         errors.add(error);
// //       });
// //     }
// //   }

// //   void removeError({String? error}) {
// //     if (errors.contains(error)) {
// //       setState(() {
// //         errors.remove(error);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: _formKey,
// //       child: Column(
// //         children: [
// //           TextFormField(
// //             keyboardType: TextInputType.emailAddress,
// //             onSaved: (newValue) => email = newValue,
// //             onChanged: (value) {
// //               if (value.isNotEmpty) {
// //                 removeError(error: kEmailNullError);
// //               } else if (emailValidatorRegExp.hasMatch(value)) {
// //                 removeError(error: kInvalidEmailError);
// //               }
// //               return;
// //             },
// //             validator: (value) {
// //               if (value!.isEmpty) {
// //                 addError(error: kEmailNullError);
// //                 return "";
// //               } else if (!emailValidatorRegExp.hasMatch(value)) {
// //                 addError(error: kInvalidEmailError);
// //                 return "";
// //               }
// //               return null;
// //             },
// //             decoration: const InputDecoration(
// //               labelText: "Email",
// //               hintText: "Enter your email",
// //               // If  you are using latest version of flutter then lable text and hint text shown like this
// //               // if you r using flutter less then 1.20.* then maybe this is not working properly
// //               floatingLabelBehavior: FloatingLabelBehavior.always,
// //               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           TextFormField(
// //             obscureText: true,
// //             onSaved: (newValue) => password = newValue,
// //             onChanged: (value) {
// //               if (value.isNotEmpty) {
// //                 removeError(error: kPassNullError);
// //               } else if (value.length >= 8) {
// //                 removeError(error: kShortPassError);
// //               }
// //               password = value;
// //             },
// //             validator: (value) {
// //               if (value!.isEmpty) {
// //                 addError(error: kPassNullError);
// //                 return "";
// //               } else if (value.length < 8) {
// //                 addError(error: kShortPassError);
// //                 return "";
// //               }
// //               return null;
// //             },
// //             decoration: const InputDecoration(
// //               labelText: "Password",
// //               hintText: "Enter your password",
// //               // If  you are using latest version of flutter then lable text and hint text shown like this
// //               // if you r using flutter less then 1.20.* then maybe this is not working properly
// //               floatingLabelBehavior: FloatingLabelBehavior.always,
// //               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
// //             ),
// //           ),
// //           const SizedBox(height: 20),
// //           TextFormField(
// //             obscureText: true,
// //             onSaved: (newValue) => conform_password = newValue,
// //             onChanged: (value) {
// //               if (value.isNotEmpty) {
// //                 removeError(error: kPassNullError);
// //               } else if (value.isNotEmpty && password == conform_password) {
// //                 removeError(error: kMatchPassError);
// //               }
// //               conform_password = value;
// //             },
// //             validator: (value) {
// //               if (value!.isEmpty) {
// //                 addError(error: kPassNullError);
// //                 return "";
// //               } else if ((password != value)) {
// //                 addError(error: kMatchPassError);
// //                 return "";
// //               }
// //               return null;
// //             },
// //             decoration: const InputDecoration(
// //               labelText: "Confirm Password",
// //               hintText: "Re-enter your password",
// //               // If  you are using latest version of flutter then lable text and hint text shown like this
// //               // if you r using flutter less then 1.20.* then maybe this is not working properly
// //               floatingLabelBehavior: FloatingLabelBehavior.always,
// //               suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
// //             ),
// //           ),
// //           FormError(errors: errors),
// //           const SizedBox(height: 20),
// //           ElevatedButton(
// //             onPressed: () {
// //               if (_formKey.currentState!.validate()) {
// //                 _formKey.currentState!.save();
// //                 // if all are valid then go to success screen
// //                 Navigator.pushNamed(context, CompleteProfileScreen.routeName);
// //               }
// //             },
// //             child: const Text("Continue"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:shop_app/screens/sigup_succes/sigup_succes.dart';
import 'package:shop_app/service/signup_service.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../complete_profile/complete_profile_screen.dart';

enum Signup {
  signup,
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  Signup _signup = Signup.signup;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final SignUpService _signUpService = SignUpService();
  String? email;
  String? name;
  String? phone;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];
  @override
  // void dispose() {
  //   super.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _emailController.dispose();
  //   _phoneController.dispose();
  // }

  void signUpUser() {
    _signUpService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
      phone: _phoneController.text,
    );
  }

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",

              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: _nameController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }

              return null;
            },
            decoration: const InputDecoration(
              labelText: "name",
              hintText: "Enter your name",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.phone,
            controller: _phoneController,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "phone",
              hintText: "Enter your phone",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
              password = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          // const SizedBox(height: 20),
          // TextFormField(
          //   obscureText: true,

          //   decoration: const InputDecoration(
          //     labelText: "Confirm Password",
          //     hintText: "Re-enter your password",
          //     // If  you are using latest version of flutter then lable text and hint text shown like this
          //     // if you r using flutter less then 1.20.* then maybe this is not working properly
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //     suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          //   ),
          // ),
          FormError(errors: errors),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                signUpUser();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, CompleteSignupScreen.routeName);
              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
