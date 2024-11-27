import 'package:appstean_test/main.dart';
import 'package:appstean_test/module/home/home_screen.dart';
import 'package:appstean_test/module/signup/sign_up_screen.dart';
import 'package:appstean_test/utility/app_constant.dart';
import 'package:appstean_test/utility/shared_preference.dart';
import 'package:appstean_test/utility/widgets/app_bar_widget.dart';
import 'package:appstean_test/utility/widgets/custom_button.dart';
import 'package:appstean_test/utility/widgets/custom_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: AppConstant.login,
            showBackBtn: false,
          )),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            AppConstant.appName,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
            child: CustomField(
              controller: userNameController,
              keyboardType: TextInputType.text,
              hintTxt: AppConstant.enterUserName,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 30),
            child: CustomField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintTxt: AppConstant.enterPassword,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  txt: AppConstant.next,
                  onPress: () async {
                    var result = await dbHelper.checkUserAndPassword(
                        userNameController.text.trim(),
                        passwordController.text.trim());
                    if (result && context.mounted) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                          (route) => false);
                      await SharedPrefer.instance.setBool(AppConstant.isLogin, true);
                    } else {
                      showErrorMsg("Alert", "Login Failed!");
                    }
                  },
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()));
            },
            child: const Text(
              "New User Sign-Up!",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          )
        ],
      ),
    );
  }

  showErrorMsg(title, message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
