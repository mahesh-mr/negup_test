import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:negup_task/view/screen/screen_home/screen_home.dart';
import 'package:negup_task/view/screen/widgets/custom_button.dart';
import 'package:negup_task/view/screen/widgets/custom_fomfeld.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static final storage = GetStorage();

  bool isChecked = false;

  final GlobalKey<FormState> _fomkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final height15 = SizedBox(height: height * .02);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .07),
        child: Form(
          key: _fomkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              email(),
              height15,
              passeord(),
              height15,
              button(context),
            ],
          ),
        ),
      ),
    );
  }

  CustomTextForm email() {
    return CustomTextForm(
      controller: _emailController,
      icons: Icons.email,
      maxline: 1,
      textinputType: TextInputType.emailAddress,
      title: "Email adress",
      validator: (value) {
        if (value!.isEmpty) {
          return " Password minimum  1 length";
        } else {
          return null;
        }
      },
    );
  }

  CustomTextForm passeord() {
    return CustomTextForm(
      controller: _passwordController,
      icons: Icons.lock,
      maxline: 1,
      textinputType: TextInputType.visiblePassword,
      title: "Password",
      validator: (value) {
        if (value!.isEmpty) {
          return " Password minimum  1 length";
        } else {
          return null;
        }
      },
    );
  }

  CustomButton button(BuildContext context) {
    return CustomButton(
        color: Colors.green,
        onPressed: () async {
          bool isValid = _fomkey.currentState!.validate();
          if (isValid) {
            storage.write("isLogin", true);
            storage.write("username", _emailController.text);
            storage.write("password", _passwordController.text);

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("pleas Login")));
          }
        },
        title: "LOGIN");
  }
}
