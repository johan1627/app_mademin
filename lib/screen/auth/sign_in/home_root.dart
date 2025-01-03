import 'package:app_mademin/components/molecules/error_page.dart';
import 'package:app_mademin/components/atoms/gen_loading_page.dart';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/providers/house_user_provider.dart';
import 'package:app_mademin/providers/misc_provider.dart';
import 'package:app_mademin/screen/auth/sign_in/force_update_page.dart';
import 'package:app_mademin/screen/auth/sign_in/sign_in.dart';
import 'package:app_mademin/screen/auth/welcome_home/welcome_home.dart';
import 'package:app_mademin/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeRoot extends StatefulWidget {
  final String email;

  const HomeRoot({
    super.key,
    required this.email,
  });

  @override
  State<HomeRoot> createState() => _HomeRootState();
}

class _HomeRootState extends State<HomeRoot> {
  //
  bool isLoading = false;
  bool isError = false;
  bool isForceUpdate = false;
  //
  bool isRegisteredUser = false;
  bool isRegisterHouseUser = false;

  Future<void> checkAuth(String? email) async {
    var resAuth =
        await Provider.of<AuthProvider>(context, listen: false).fetchAuth();

    if (resAuth.statusCode == "200") {
      if (mounted) {
        setState(() {
          isRegisteredUser = true;
        });
      }
    } else if (resAuth.statusCode == "401") {
      if (mounted) {
        setState(() {
          isRegisteredUser = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          isError = true;
          isRegisteredUser = false;
        });
      }
    }
  }

  Future<void> checkVersion() async {
    var res = await Provider.of<MiscProvider>(context, listen: false).fetch();

    var appVersion = versionBackend;

    if (res.statusCode == "200") {
      if (appVersion < res.value!.versionBackend!) {
        if (mounted) {
          setState(() {
            isForceUpdate = true;
          });
        }
      }
    }
  }

  Future<void> checkHouseUser() async {
    var res = await Provider.of<HouseUserProvider>(context, listen: false)
        .fetchByAuth([1]);

    if (res.statusCode == "200") {
      //
      setState(() {
        isRegisterHouseUser = true;
      });
    }
  }

  void init() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    if (mounted) {
      await checkAuth(widget.email);
      await checkVersion();
      await checkHouseUser();
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (isLoading) {
      page = const LoadingSimple(
        lable: "Memuat data...",
      );
    } else {
      if (isError) {
        page = const ErrorPage();
      } else if (isForceUpdate) {
        page = const ForceUpdatePage();
      } else {
        if (isRegisteredUser) {
          if (isRegisterHouseUser) {
            page = const HomePage();
          } else {
            page = const WelcomeHomePage();
          }
        } else {
          page = const SignInPage();
        }
      }
    }

    return page;
  }
}
