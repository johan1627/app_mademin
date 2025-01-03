import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/atoms/gen_textfield.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/molecules/gen_create_page.dart';
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
  bool isVisibleEmailMsgErr = false;
  bool isVisibleHandphoneMsgErr = false;
  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conHandphone = TextEditingController();

  // import class function
  GeneralFunction function = GeneralFunction();

  bool isValidName() {
    if (_conName.text != "") {
      return true;
    } else {
      return false;
    }
  }

  bool isValidEmail() {
    if (_conEmail.text != "") {
      var valid = function.isValidateEmail(_conEmail.text);
      if (valid) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  bool isValidHandphone() {
    if (_conHandphone.text != "") {
      var valid = function.isValidateMobileNumber(_conHandphone.text);
      if (valid) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  void isEnableBtn() {
    bool validName = isValidName();
    bool validEmail = isValidEmail();
    bool validHandphone = isValidHandphone();

    if (validName && validEmail && validHandphone) {
      // button, error message
      setState(() {
        isEnabledSaved = true;
        isVisibleEmailMsgErr = false;
        isVisibleHandphoneMsgErr = false;
      });
    } else {
      // button
      setState(() {
        isEnabledSaved = false;
      });

      // error message
      // validEmail
      if (validEmail == false) {
        if (_conEmail.text.length > 2) {
          setState(() {
            isVisibleEmailMsgErr = true;
          });
        } else {
          setState(() {
            isVisibleEmailMsgErr = false;
          });
        }
      } else {
        setState(() {
          isVisibleEmailMsgErr = false;
        });
      }

      // valid Handphone
      if (validHandphone == false) {
        if (_conHandphone.text.length > 2) {
          setState(() {
            isVisibleHandphoneMsgErr = true;
          });
        } else {
          setState(() {
            isVisibleHandphoneMsgErr = false;
          });
        }
      } else {
        setState(() {
          isVisibleHandphoneMsgErr = false;
        });
      }
    }
  }

  void onSubmit() async {
    setState(() {
      isLoading = true;
    });

    var name = _conName.text.toString();
    var email = _conEmail.text.toString();
    var handphone = _conHandphone.text.toString();

    var res = await Provider.of<AuthProvider>(context, listen: false)
        .signUp(name, email, handphone);

    if (res.statusCode == "200") {
      if (context.mounted) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const SignInPage(),
        ));

        function.snackBar(
            context, "Email terkirim, periksa kotak masuk Email Anda", 4);
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
      title: "Daftar Akun",
      subtitle: "Lengkapi data dibawah",
      onBack: _back,
      body: ListView(
        children: [
          TextFieldCustom(
            lable: "Nama Anda",
            hintText: "Senna Aisyah",
            controller: _conName,
            keyboardType: TextInputType.text,
            length: 100,
            isPassword: false,
            onChanged: (value) {
              isEnableBtn();
            },
          ),
          TextFieldCustom(
            lable: "Email",
            hintText: "senna.aisyah@gmail.com",
            controller: _conEmail,
            keyboardType: TextInputType.emailAddress,
            length: 50,
            isPassword: false,
            onChanged: (value) {
              isEnableBtn();
            },
          ),
          Visibility(
            visible: isVisibleEmailMsgErr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Format Email belum benar",
                style: footFont.copyWith(color: redColor),
              ),
            ),
          ),
          TextFieldCustom(
            lable: "Nomor HP",
            hintText: "081234567890",
            controller: _conHandphone,
            keyboardType: TextInputType.phone,
            length: 12, // valid is length 12
            isPassword: false,
            onChanged: (value) {
              isEnableBtn();
            },
          ),
          Visibility(
            visible: isVisibleHandphoneMsgErr,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Format Nomor HP belum benar",
                style: footFont.copyWith(color: redColor),
              ),
            ),
          ),
        ],
      ),
      onSaved: () {
        onSubmit();
      },
      isEnableBtn: isEnabledSaved,
      isLoading: isLoading,
      btnIcon: Icons.verified_user_outlined,
      btnLable: "Daftar Sekarang",
    );
  }
}
