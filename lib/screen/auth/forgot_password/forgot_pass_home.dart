import 'package:app_mademin/components/atoms/gen_function.dart';
import 'package:app_mademin/components/misc/const_styles.dart';
import 'package:app_mademin/components/atoms/gen_textfield.dart';
import 'package:app_mademin/components/molecules/gen_create_page.dart';
import 'package:app_mademin/providers/auth_provider.dart';
import 'package:app_mademin/screen/auth/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ForgotPasswordHome extends StatefulWidget {
  const ForgotPasswordHome({super.key});

  @override
  State<ForgotPasswordHome> createState() => _ForgotPasswordHomeState();
}

class _ForgotPasswordHomeState extends State<ForgotPasswordHome> {
  // initial
  bool isLoading = false;
  bool isEnabledSaved = false;
  final _conEmail = TextEditingController();

  // import class function
  GeneralFunction function = GeneralFunction();

  void onSubmit() async {
    setState(() {
      isLoading = true;
    });

    var email = _conEmail.text.toString();
    var res = await Provider.of<AuthProvider>(context, listen: false)
        .forgotPassword(email);

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

  void isEnabledBtn() {
    if (_conEmail.text != "") {
      // valid email address
      var valid = function.isValidateEmail(_conEmail.text);
      if (valid) {
        setState(() {
          isEnabledSaved = true;
        });
      } else {
        setState(() {
          isEnabledSaved = false;
        });
      }
    } else {
      setState(() {
        isEnabledSaved = false;
      });
    }
  }

  Future<bool> _back() async {
    Navigator.of(context).pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GeneralCreatePages(
      title: "Lupa kata sandi",
      subtitle: "Silahkan isi Email Anda",
      onBack: _back,
      body: ListView(
        children: [
          TextFieldCustom(
            lable: "Email",
            hintText: "senna.aisyah@gmail.com",
            controller: _conEmail,
            keyboardType: TextInputType.emailAddress,
            length: 50,
            isPassword: false,
            onChanged: (value) {
              isEnabledBtn();
            },
          ),
        ],
      ),
      onSaved: () {
        onSubmit();
      },
      isEnableBtn: isEnabledSaved,
      isLoading: isLoading,
      btnIcon: Icons.forward_to_inbox,
      btnLable: "Kirim Sekarang",
    );
  }
}
