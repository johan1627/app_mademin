import 'package:app_mademin/components/atoms/gen_button.dart';
import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/atoms/gen_textfield.dart';
import 'package:app_mademin/components/atoms/gen_textlink.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/config/config.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/forgot_password/forgot_pass_home.dart';
import 'package:app_mademin/screen/auth/sign_in/home_root.dart';
import 'package:app_mademin/screen/auth/sign_up/sign_up_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // import class function
  GeneralFunction function = GeneralFunction();

  // initial
  var contEmail = TextEditingController();
  var contPass = TextEditingController();
  bool isEnabledBtn = false;
  bool isLoading = false;

  // function
  void isValidateEmail() async {
    //
    setState(() {
      isLoading = true;
      isEnabledBtn = false;
    });

    var txEmail = contEmail.text;
    var txPass = contPass.text;
    var isEmail = function.isValidateEmail(txEmail);

    if (isEmail) {
      //
      var res = await Provider.of<AuthProvider>(context, listen: false)
          .signInWithPassword(txEmail, txPass);

      if (res.statusCode == "200") {
        // Save to localStorage
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setBool('isLogin', true);
        localStorage.setString('userLogin', txEmail);

        // Go to
        Get.to(() => HomeRoot(email: txEmail));
      } else if (res.statusCode == "401" || res.statusCode == "206") {
        var message = res.message;

        final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: redColor,
          action: SnackBarAction(
            label: 'OK',
            textColor: whiteFlat,
            onPressed: () {},
          ),
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        // failed 500
        var message = res.message;

        final snackBar = SnackBar(
          content: Text(message),
          backgroundColor: redColor,
          action: SnackBarAction(
            label: 'OK',
            textColor: whiteFlat,
            onPressed: () {},
          ),
        );

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } else {
      //
      final snackBar = SnackBar(
        content: const Text('format Email belum benar'),
        backgroundColor: redColor,
        action: SnackBarAction(
          label: 'OK',
          textColor: whiteFlat,
          onPressed: () {},
        ),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  void isBtnEnabled() {
    if (contEmail.text != "" && contPass.text != "") {
      setState(() {
        isEnabledBtn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          return function.onWillPop(context);
        },
        child: Scaffold(
          backgroundColor: whiteFlat,
          body: Stack(
            children: [
              // backgroundColor
              Container(
                color: whiteFlat,
                height: 80.0,
              ),
              SingleChildScrollView(
                child: Container(
                  color: whiteFlat,
                  child: Column(
                    children: [
                      // start content fill
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // logo
                            const Image(
                              width: 160.0,
                              image:
                                  AssetImage("assets/img/logo-temuwarga.png"),
                            ),
                            const SizedBox(height: 60.0),
                            // title
                            Text(
                              "Masuk",
                              style: h1.copyWith(
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            // Email
                            TextFieldCustom(
                              controller: contEmail,
                              keyboardType: TextInputType.emailAddress,
                              lable: 'Email',
                              length: 100,
                              isPassword: false,
                              onChanged: (value) {
                                isBtnEnabled();
                              },
                            ),
                            const SizedBox(height: 10.0),
                            // Password
                            TextFieldCustom(
                              controller: contPass,
                              keyboardType: TextInputType.text,
                              lable: 'Kata sandi',
                              length: 50,
                              isPassword: true,
                              onChanged: (value) {
                                isBtnEnabled();
                              },
                            ),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextLink(
                                color: blackFlat,
                                title: "Lupa kata sandi?",
                                onPressed: () {
                                  // Go to
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ForgotPasswordHome(),
                                  ));
                                },
                              ),
                            ),

                            const SizedBox(height: 0.0),
                            // button
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: ButtonWide(
                                  isLoading: isLoading,
                                  isEnabled: isEnabledBtn,
                                  type: "primary",
                                  lable: 'Masuk',
                                  onSaved: () {
                                    isValidateEmail();
                                  },
                                ),
                              ),
                            ),

                            // Don't have account
                            Align(
                              alignment: Alignment.center,
                              child: TextLink(
                                color: blackFlat,
                                title:
                                    "belum punya akun? daftar", // don't have account? sign up
                                onPressed: () {
                                  // Go to
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SignUpHome(),
                                  ));
                                },
                              ),
                            ),

                            // Need Help
                            Align(
                              alignment: Alignment.center,
                              child: TextLink(
                                color: blackFlat,
                                title: "Perlu bantuan?",
                                onPressed: () {
                                  function.getLaunchUrl(
                                      "wa.me", "/$whatsappNumber&text=");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // end content fill
                    ],
                  ),
                ),
              ),
              // bottom
            ],
          ),
          bottomNavigationBar: Container(
            color: whiteFlat,
            height: 90.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextLink(
                      color: blackFlat,
                      title: "ketentuan",
                      onPressed: () {
                        function.getLaunchUrl("noonapos.com", "/term");
                      },
                    ),
                    TextLink(
                      color: blackFlat,
                      title: "kebijakan privasi",
                      onPressed: () {
                        function.getLaunchUrl("noonapos.com", "/policy");
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    "versi apps $versionName",
                    style: smallFont.copyWith(
                      color: blackFlat,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
