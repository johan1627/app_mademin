import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/atoms/gen_textfield.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/gencreate.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpHomeState();
}

class _SignUpHomeState extends State<SignUpHome> {
  // initial
  bool isLoading = false;
  bool isEnabledSaved = false;
  bool isVisibleMsgErr = false;
  final _conEmail = TextEditingController();
  final _conName = TextEditingController();

  // import class function
  GeneralFunction function = GeneralFunction();

  void isEnabledBtn() {
    if (_conEmail.text != "" && _conName.text != "") {
      // valid email address
      var valid = function.isValidateEmail(_conEmail.text);
      if (valid) {
        setState(() {
          isEnabledSaved = true;
          isVisibleMsgErr = false;
        });
      } else {
        setState(() {
          isEnabledSaved = false;
        });

        //
        if (_conEmail.text.length > 2) {
          setState(() {
            isVisibleMsgErr = true;
          });
        }
      }
    } else {
      setState(() {
        isEnabledSaved = false;
        isVisibleMsgErr = false;
      });
    }
  }

  void onSubmit() async {
    setState(() {
      isLoading = true;
    });

    var name = _conName.text.toString();
    var email = _conEmail.text.toString();
    var res = await Provider.of<AuthProvider>(context, listen: false)
        .signUp(name, email, "");

    if (res.statusCode == "200") {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        ));

        function.snackBar(context, "Email sent, please check your inbox", 4);
      }
    } else {
      var message = res.message;
      Get.snackbar("Authentification", message,
          backgroundColor: redColor,
          colorText: whiteFlat,
          margin: const EdgeInsets.only(top: 4.0));
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<bool> _back() async {
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralCreatePages(
      title: "Sign Up Account",
      subtitle: "Please fill data below",
      onBack: _back,
      body: ListView(
        children: [
          TextFieldCustom(
            lable: "Your name",
            hintText: "Senna Aisyah",
            controller: _conName,
            keyboardType: TextInputType.text,
            length: 100,
            isPassword: false,
            onChanged: (value) {
              isEnabledBtn();
            },
          ),
          TextFieldCustom(
            lable: "Email Address",
            hintText: "senna.aisyah@gmail.com",
            controller: _conEmail,
            keyboardType: TextInputType.emailAddress,
            length: 50,
            isPassword: false,
            onChanged: (value) {
              isEnabledBtn();
            },
          ),
          Visibility(
            visible: isVisibleMsgErr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "email address not valid",
                style: footFont.copyWith(color: redColor),
              ),
            ),
          )
        ],
      ),
      onSaved: () {
        onSubmit();
      },
      isEnableBtn: isEnabledSaved,
      isLoading: isLoading,
      btnIcon: Icons.verified_user_outlined,
      btnLable: "SIGN UP",
    );
  }
}
