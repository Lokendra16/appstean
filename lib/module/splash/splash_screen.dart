import 'package:appstean_test/module/login/login_screen.dart';
import 'package:appstean_test/module/splash/bloc/splash_screen_bloc.dart';
import 'package:appstean_test/utility/app_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

SplashScreenBloc splashScreenBloc = SplashScreenBloc();

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              AppConstant.appName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

checkLoginStatus() {
  Future.delayed(const Duration(seconds: 2), () {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const LoginScreen()));
  });
}
}
