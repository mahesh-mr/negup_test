import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:negup_task/view/screen/screen_home/screen_home.dart';
import 'package:negup_task/view/screen/screen_login/screen_login.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  GetStorage storage = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home:
          storage.read('isLogin')==null ?  LoginScreen():const HomeScreen() ,
    );
  }
}
