import 'package:app_mademin/components/molecules/loading_page.dart';
import 'package:app_mademin/screen/auth/sign_in/home_root.dart';
import 'package:app_mademin/screen/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRoot extends StatefulWidget {
  const AuthRoot({super.key});

  @override
  State<AuthRoot> createState() => _AuthRootState();
}

class _AuthRootState extends State<AuthRoot> {
  //
  bool isLoading = false;
  bool isLogin = false;
  String userEmailLogin = "";

  void checkIsLogin() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var isLoginLocal = localStorage.getBool('isLogin');
    var userLoginLocal = localStorage.get('userLogin');

    if (mounted) {
      setState(() {
        isLogin = isLoginLocal ?? false;
        userEmailLogin = userLoginLocal.toString();
      });
    }
  }

  @override
  void initState() {
    checkIsLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (isLoading) {
      page = const LoadingSimple(
        lable: "Memuat data...",
      );
    } else {
      if (isLogin) {
        page = HomeRoot(
          email: userEmailLogin,
        );
      } else {
        page = const SignInPage();
      }
    }

    return page;
  }
}
