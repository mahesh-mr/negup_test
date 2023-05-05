import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:negup_task/view/screen/screen_login/screen_login.dart';
import 'package:negup_task/view/screen/widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final height15 = SizedBox(height: height * .02);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Localy Stored Data :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              height15,
              Text(
                storage.read("username"),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              height15,
              Text(
                storage.read("password"),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              height15,
              CustomButton(color:  Colors.red,
                  onPressed: () {
                    storage.write("isLogin", false);
                    storage.remove('username');
                    storage.remove('password');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  title: "LOGOUT")
            ],
          ),
        ),
      ),
    );
  }
}
