import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // import
  GeneralFunction function = GeneralFunction();

  //
  // void logoutOption() async {
  //   // GET to localStorage
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var isLoginWithGoogle = localStorage.get('isLoginWithGoogle');
  //   //
  //   if (isLoginWithGoogle == true) {
  //     googleSignOut();
  //   } else {
  //     commonSignOut();
  //   }
  // }

  // void commonSignOut() {
  //   final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
  //   provider.logout();
  //   // Go to
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (BuildContext context) => const SignInPage(),
  //   ));
  // }

  // void googleSignOut() {
  //   final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
  //   provider.googleLogout();

  //   // Go to
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (BuildContext context) => const SignInPage(),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () {
            return function.onWillPop(context);
          },
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/img/assets-02.png',
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Kelola & Monitor Kasir Kedai, Toko',
                        style: lableFont.copyWith(color: blackFlat),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      ButtonWide(
                        isLoading: false,
                        isEnabled: true,
                        type: "primary",
                        lable: "Hubungi Kami",
                        onSaved: () {
                          function.getLaunchUrl(
                              "noonapos.com", "/p/hubungi-kami");
                        },
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonWide(
                      isLoading: false,
                      isEnabled: true,
                      type: "primary outline",
                      lable: "Kembali",
                      onSaved: () {
                        // logoutOption();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
